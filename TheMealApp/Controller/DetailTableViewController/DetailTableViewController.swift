//
//  DetailTableViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import UIKit

protocol DetailTableViewControllerProtocol:
    AsynchronousImageLoadingProtocol,
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
    SectionIdentifierProtocol
{
    
    // MARK: Sections:
    enum SectionIdentifier: Int, CaseIterable {
        case titleAndImage
        case instructions
        case ingredients
    }
    
    var status: NetworkingStatus = .loading
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
        
        // TableView:
        tableView.separatorStyle = .none
    }
    
    func fetchMeal(from id: String) {
        let endpoint = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
        decodeDataFromJSON(url: endpoint + id, to: MealsByID.self) { result in
            
            switch result {
                case .success(let value):
                    switch value {
                        case .response(let meals):
                            self.meal = meals.meals[0].createRenderableMeal()
                            self.status = .loaded
                            self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                    self.status = .failed
            }
        }
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
        
        guard
            let meal = meal,
            status == .loaded
        else {
            switch status {
                case .loading:
                    let label = "Loading..."
                    return configureIconTableViewCell(label: label, showDisclosure: false, icon: .bacon, tintColor: .accentColor, tableView: self.tableView, for: indexPath)
                default:
                    let label = "There was an issue making this meal!"
                    return configureIconTableViewCell(label: label, showDisclosure: false, icon: .appleCore, tintColor: .systemRed, tableView: self.tableView, for: indexPath)
            }
        }
        
        switch sectionIdentifierFor(indexPath.section) {
            case .titleAndImage:
                switch indexPath.row {
                    case 0:
                        let label = meal.name
                        return configureHeaderTableViewCell(label: label, textColor: nil, icon: nil, tintColor: nil, isSelectable: false, tableView: self.tableView, for: indexPath)
                    case 1:
                        let url = meal.imageURL
                        asynchronousLoadImage(from: url, for: indexPath)
                        return configureMealImageTableViewCell(tableView: self.tableView, for: indexPath)
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
        
        guard status == .loaded else { return }
        
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
    
    func asynchronousLoadImage(from url: String?, for indexPath: IndexPath) {
        asyncImageLoad(from: url) { result in
            guard let cell = self.tableView.cellForRow(at: indexPath) as? MealImageTableViewCell else { return }
            switch result {
                case .success(let loadingState):
                    self.updateLoadingState(cell: cell, loadingState: loadingState)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.updateLoadingState(cell: cell, loadingState: .error(error.localizedDescription))
            }
        }
    }
    
}
