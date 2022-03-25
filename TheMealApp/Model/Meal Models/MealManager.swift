//
//  MealManager.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import Foundation
import UIKit

protocol NetworkingMealManagerDelegate {
    func asynchronousImageLoadingStateChanged(loadingState: AsynchronousImageLoadingState, for indexPath: IndexPath)
    func didUpdateMealsInCategory(meals: [MealsInCategory])
    func didUpdateRenderableMeal(meal: RenderableMeal?)
}

struct MealManager {
    
    var delegate: NetworkingMealManagerDelegate?
    
    
    func asyncImageLoad(from url: URL, for indexPath: IndexPath) {
        
        delegate?.asynchronousImageLoadingStateChanged(loadingState: .loading, for: indexPath)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else {
                delegate?.asynchronousImageLoadingStateChanged(loadingState: .error, for: indexPath)
                return
            }
            
            DispatchQueue.main.async {
                guard let imageFromData = UIImage(data: data) else {
                    delegate?.asynchronousImageLoadingStateChanged(loadingState: .error, for: indexPath)
                    return
                }
                delegate?.asynchronousImageLoadingStateChanged(loadingState: .loaded(imageFromData), for: indexPath) //Should use .error
            }
        }
        task.resume()
    }
    
    
    // Fetch a meals by category and return an `[MealsInCategory]` or [] if theres a failure
    func fetchMeals(from category: MealCategories) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
        guard let url = URL(string: url + category.rawValue) else { // Add additonal error handling in future
            delegate?.didUpdateMealsInCategory(meals: [])
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { // Add additonal error handling in future
                delegate?.didUpdateMealsInCategory(meals: [])
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Meals.self, from: data)
                    delegate?.didUpdateMealsInCategory(meals: decodedData.meals)
                } catch { // Add additonal error handling in future
                    print(#fileID)
                    print(#function, #line)
                    print(error.localizedDescription)
                    delegate?.didUpdateMealsInCategory(meals: [])
                    return
                }
            }
        }
        task.resume()
    }
    
    
    // Fetch a meal by it's meal ID and return a `RenderableMeal` or nil if theres a failure
    func fetchMeal(from id: String) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
        guard let url = URL(string: url + id) else {
            delegate?.didUpdateRenderableMeal(meal: nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { // Add additonal error handling in future
                delegate?.didUpdateRenderableMeal(meal: nil)
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MealsByID.self, from: data)
                    let renderableMeal = decodedData.meals[0].createRenderableMeal()
                    delegate?.didUpdateRenderableMeal(meal: renderableMeal)
                } catch { // Add additonal error handling in future
                    print(#fileID)
                    print(#function, #line)
                    print(error.localizedDescription)
                    delegate?.didUpdateRenderableMeal(meal: nil)
                    return
                }
            }
        }
        task.resume()
    }
    
    
}


