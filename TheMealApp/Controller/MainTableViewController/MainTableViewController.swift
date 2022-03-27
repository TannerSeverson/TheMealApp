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
    NetworkingProtocol,
    AsynchronousImageLoadingProtocol,
    MealsTableViewCellProtocol
{
    
    
    enum SegueIdentifier: String {
        // Push:
        case toDetailViewControllerFromMainTableViewController
    }
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    lazy private var dataSource: MainTableViewControllerDataSource = { MainTableViewControllerDataSource(category: .dessert, tableView: tableView) }()
    
    var meals = [MealsInCategory]()
    var category: MealCategories = .dessert {
        didSet {
            dataSource.category = category
            self.barButton.image = category.image
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cells:
        registerMealsTableViewCell(for: self.tableView)
        
        // Navigation Controller:
        setTitle(with: "The Meal App")
        
        barButton.image = category.image
        barButton.primaryAction = nil
        barButton.menu = menuForMenuBarButton()
        
        // tableView:
        tableView.dataSource = dataSource
        dataSource.fetchData()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func menuForMenuBarButton() -> UIMenu {
        
        var actions = [UIAction]()
        for category in MealCategories.categories {
            let newAction = UIAction(title: category.rawValue, image: category.image) { action in
                self.category = category
            }
            actions.append(newAction)
        }
        return UIMenu(title: "", children: actions)
    }
    
    @objc func refresh() {
        dataSource.fetchData()
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
                
                let meal = dataSource.meals[indexPath.row].idMeal
                destinationVC.fetchMeal(from: meal)
        }
    }
    
}
