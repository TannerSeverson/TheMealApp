//
//  MainTableViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

final class MainTableViewController:
    UITableViewController,
    SegueIdentifierProtocol,
    NetworkingMealManagerDelegate,
    MealsTableViewCellProtocol,
    IconTableViewCellProtocol {
    
    
    enum SegueIdentifier: String {
        // Push:
        case toDetailViewControllerFromMainTableViewController
    }
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    var mealManager = MealManager() 
    var meals = [MealsInCategory]()
    var mealCategory: MealCategories = .dessert {
        didSet {
            fetchData()
            self.barButton.image = mealCategory.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cells:
        registerIconTableViewCell(for: self.tableView)
        registerMealsTableViewCell(for: self.tableView)
        
        // Navigation Controller:
        setTitle(with: "The Meal App")
        
        barButton.image = mealCategory.image
        barButton.primaryAction = nil
        barButton.menu = menuForMenuBarButton()
        
        // Setup:
        mealManager.delegate = self
        fetchData()
        
        // Refreshing:
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func menuForMenuBarButton() -> UIMenu {
        
        var actions = [UIAction]()
        for category in MealCategories.categories {
            let newAction = UIAction(title: category.rawValue, image: category.image) { action in
                self.mealCategory = category
            }
            actions.append(newAction)
        }
        return UIMenu(title: "", children: actions)
    }
    
    
    func fetchData() {
        mealManager.fetchMeals(from: mealCategory)
    }
    
    @objc func refresh() {
        fetchData()
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard meals.count > 0 else { return 1 }
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard meals.count > 0 else {
            let label = "Loading..." // Add additonal error handling incase meals never load in future...
            return configureMealsTableViewCell(label: label, loadingState: .loading, tableView: self.tableView, for: indexPath)
        }
        
        let label = meals[indexPath.row].name
        let url = URL(string: meals[indexPath.row].imageURL)!
        mealManager.asyncImageLoad(from: url, for: indexPath)
        return configureMealsTableViewCell(label: label, loadingState: .loading, tableView: self.tableView, for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(.toDetailViewControllerFromMainTableViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare: Navigation Override: --- \(#fileID)")
        print("case: .\(segueIdentifierForSegue(segue))")
        switch segueIdentifierForSegue(segue) {
                // Push:
            case .toDetailViewControllerFromMainTableViewController:
                guard
                    let destinationVC = segue.destination as? DetailTableViewController,
                    let indexPath = tableView.indexPathForSelectedRow
                else { fatalError(#function)}
                print("Prepare: \(String(describing: type(of: destinationVC))): ---")
                
                destinationVC.mealID = meals[indexPath.row].idMeal
        }
    }
    
    // MARK: - MealManagerDelegate
    func asynchronousImageLoadingStateChanged(loadingState: AsynchronousImageLoadingState, for indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MealsTableViewCell else { return }
        updateLoadingState(cell: cell, loadingState: loadingState)
    }
    
    func didUpdateMealsInCategory(meals: [MealsInCategory]) {
        self.meals = meals
        self.tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func didUpdateRenderableMeal(meal: RenderableMeal?) {
        fatalError(String(describing: type(of: self)) + "Should not implmenet this method. Refactor protocols in future.")
    }
}
