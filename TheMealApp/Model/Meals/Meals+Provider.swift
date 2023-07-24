//
//  Meals+Provider.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meals {
    
    @MainActor
    class Provider: ObservableObject {
        
        @Published var meals: [Meals.Preview] = []
        let client: Meals.Client
        
        init(client: Meals.Client = Meals.Client()) {
            self.client = client
        }
        
        func fetch(category: Meal.Category) async throws {
            let meals = try await client.meal(category: category)
            self.meals = meals
        }
    }
}
