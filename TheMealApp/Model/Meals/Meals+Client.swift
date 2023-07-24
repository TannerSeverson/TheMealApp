//
//  Meals+Client.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meals {
    
    class Client {
        
        private let downloader: any HTTPDataDownloader
        private let baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
        
        init(downloader: any HTTPDataDownloader = URLSession.shared) {
            self.downloader = downloader
        }
        
        func meal(category: Meal.Category) async throws -> [Meals.Preview] {
            let url = URL(string: baseURL + category.rawValue)!
            let data = try await downloader.httpData(from: url)
            let category = try JSONDecoder().decode(Meals.self, from: data)
            return category.meals
        }
    }
}
