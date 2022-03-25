//
//  DetailTableViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

protocol DetailTableViewControllerProtocol:
    IconTableViewCellProtocol,
    InstructionsTableViewCellProtocol,
    HeaderTableViewCellProtocol,
    MealImageTableViewCellProtocol,
    CheckmarkTableViewCellProtocol
{
    func registerTableViewCellsForDetailTableViewControllerProtocol(for tableView: UITableView)
}
extension DetailTableViewControllerProtocol {
    func registerTableViewCellsForDetailTableViewControllerProtocol(for tableView: UITableView) {
        registerIconTableViewCell(for: tableView)
        registerMealImageTableViewCell(for: tableView)
        registerCheckmarkTableViewCell(for: tableView)
        registerInstructionsTableViewCell(for: tableView)
        registerHeaderTableViewCell(for: tableView)
    }
}

final class DetailTableViewController:
    UITableViewController,
    DetailTableViewControllerProtocol,
    SectionIdentifierProtocol,
    NetworkingMealManagerDelegate
{
    
    // MARK: Sections:
    enum SectionIdentifier: Int, CaseIterable {
        case titleAndImage
        case instructions
        case ingredients
    }
    
    var mealID: String!
    
    var mealManager = MealManager()
    var meal: RenderableMeal? {
        didSet {
            isIngredentSelected = Array(repeating: false, count:  meal?.ingredients.count ?? 0)
        }
    }
    var isIngredentSelected: [Bool]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cells:
        registerTableViewCellsForDetailTableViewControllerProtocol(for: self.tableView)
        
        // Setup:
        mealManager.delegate = self
        mealManager.fetchMeal(from: mealID)
        
        // TableView:
        tableView.separatorStyle = .none
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard meal != nil else { return 1 }
        return SectionIdentifier.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let meal = meal else { return 1 }
        switch sectionIdentifierFor(section) {
            case .titleAndImage: return 2
            case .instructions: return 2
            case .ingredients: return meal.ingredients.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let meal = meal else {
            let label = "There was an issue making this meal!"
            return configureIconTableViewCell(label: label, showDisclosure: false, icon: .appleCore, tintColor: .systemRed, tableView: self.tableView, for: indexPath)
            // Add more error handling later
            // Including a changing the inital load to a loading indicator, and only rendering this failure message if the network request actually failed and isn't loading.
        }
        
        switch sectionIdentifierFor(indexPath.section) {
            case .titleAndImage:
                switch indexPath.row {
                    case 0:
                        let label = meal.name
                        return configureHeaderTableViewCell(label: label, textColor: nil, icon: nil, tintColor: nil, isSelectable: false, tableView: self.tableView, for: indexPath)
                    case 1:
                        guard
                            let imageURL = meal.imageURL,
                            let url = URL(string: imageURL) else {
                                return configureMealImageTableViewCell(loadingState: .error, tableView: self.tableView, for: indexPath)
                            }
                        mealManager.asyncImageLoad(from: url, for: indexPath)
                        return configureMealImageTableViewCell(loadingState: .loading, tableView: self.tableView, for: indexPath)
                    default:
                        break
                }
            case .instructions:
                switch indexPath.row {
                    case 0:
                        let label = "Instructions:"
                        return configureHeaderTableViewCell(label: label, textColor: nil, icon: Icons.memo, tintColor: .accentColor, isSelectable: false, tableView: self.tableView, for: indexPath)
                    case 1:
                        let label = meal.instructions
                        return configureInstructionsTableViewCell(label: label, tableView: self.tableView, for: indexPath)
                    default:
                        break
                }
            case .ingredients:
                switch indexPath.row {
                    case 0:
                        let label = "Ingredients:"
                        return configureHeaderTableViewCell(label: label, textColor: nil, icon: Icons.chef, tintColor: .accentColor, isSelectable: false, tableView: self.tableView, for: indexPath)
                    default:
                        let measure = meal.ingredients[indexPath.row - 1]
                        let label = measure
                        return configureCheckmarkTableViewCell(label: label, showDisclosure: false, tintColor: .accentColor, isSelected: isIngredentSelected[indexPath.row-1], tableView: self.tableView, for: indexPath)
                }
        }
        fatalError("There should not be a `UITableViewCell` at `indexPath` \(indexPath)")
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        switch sectionIdentifierFor(indexPath.section) {
            case .titleAndImage: break
            case .instructions: break
            case .ingredients:
                switch indexPath.row {
                    case 0:
                        break
                    default:
                        guard let cell = tableView.cellForRow(at: indexPath) as? CheckmarkTableViewCell else { break }
                        isIngredentSelected[indexPath.row-1].toggle()
                        cell.configureFor(isSelected: isIngredentSelected[indexPath.row-1])
                        break
                }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: MealManagerDelegate
    func asynchronousImageLoadingStateChanged(loadingState: AsynchronousImageLoadingState, for indexPath: IndexPath) {
        switch sectionIdentifierFor(indexPath.section) {
            case .titleAndImage:
                switch indexPath.row {
                    case 1:
                        guard let cell = tableView.cellForRow(at: indexPath) as? MealImageTableViewCell else { return }
                        updateLoadingState(cell: cell, loadingState: loadingState)
                    default: return
                }
            default: return
        }
    }
    
    
    func didUpdateMealsInCategory(meals: [MealsInCategory]) {
        fatalError(String(describing: type(of: self)) + "Should not implmenet this method. Refactor protocols in future.")
    }
    
    func didUpdateRenderableMeal(meal: RenderableMeal?) {
        self.meal = meal
        tableView.reloadData()
    }
    
}
