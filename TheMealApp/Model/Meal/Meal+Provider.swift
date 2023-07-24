//
//  Meal+Provider.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meal {
    
    @MainActor
    class Provider: ObservableObject {
        
        @Published var meal: Meal?
        let client: Meal.Client
        
        init(client: Meal.Client = Meal.Client()) {
            self.client = client
        }
        
        func fetch(mealID: String) async throws {
            let meal = try await client.meal(id: mealID)
            self.meal = meal
        }
    }
}
