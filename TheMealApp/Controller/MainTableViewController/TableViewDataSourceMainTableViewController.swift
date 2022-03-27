//
//  TableViewDataSourceMainTableViewController.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/26/22.
//

import UIKit

final class MainTableViewControllerDataSource:
    NSObject,
    UITableViewDataSource,
    NetworkingProtocol,
    AsynchronousImageLoadingProtocol,
    MealsTableViewCellProtocol
{
    
    var tableView: UITableView!
    var status: NetworkingStatus = .loading
    var meals = [MealsInCategory]()
    var category: MealCategories {
        didSet {
            fetchData()
        }
    }
    
    init(category: MealCategories, tableView: UITableView) {
        self.category = category
        self.tableView = tableView
    }
    
    func fetchData() {
        print(#function)
        
        status = .loading
        let endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
        let url = URL(string: endpoint + category.rawValue)
        decodeDataFromJSON(url: url, to: Meals.self) { result in
            
            switch result {
                case .success(let value):
                    switch value {
                        case .response(let meals):
                            self.meals = meals.meals
                            self.status = .loaded
                            self.tableView.refreshControl?.endRefreshing()
                            self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                    self.status = .failed
                    self.tableView.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            meals.count > 0,
            status == .loaded
        else { return 1 }
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch status {
            case .loading:
                let label = "Loading..."
                return configureMealsTableViewCell(label: label, tableView: tableView, for: indexPath)
            case .failed:
                let label = "Failed! Please try again!"
                return configureMealsTableViewCell(label: label, tableView: tableView, for: indexPath)
            case .loaded:
                let label = meals[indexPath.row].name
                let url = meals[indexPath.row].imageURL
                asynchronousLoadImage(from: url, for: indexPath)
                return configureMealsTableViewCell(label: label, tableView: tableView, for: indexPath)
        }
    }
    
    
    func asynchronousLoadImage(from url: String, for indexPath: IndexPath) {
        asyncImageLoad(from: url) { result in
            guard let cell = self.tableView.cellForRow(at: indexPath) as? MealsTableViewCell else { return }
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
