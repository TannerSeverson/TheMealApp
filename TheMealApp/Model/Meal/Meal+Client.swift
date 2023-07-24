//
//  Meal+Client.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meal {
    
    class Client {
        
        let baseURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
        private let downloader: any HTTPDataDownloader
        
        init(downloader: any HTTPDataDownloader = URLSession.shared) {
            self.downloader = downloader
        }
        
        func meal(id: String) async throws -> Meal? {
            let url = URL(string: baseURL + id)!
            let data = try await downloader.httpData(from: url)
            let meal = try JSONDecoder().decode(Meal.FromID.self, from: data)
            return meal.meals.first
        }
    }
}
