//
//  MealDetailScreen.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

struct MealDetailScreen: View {
    
    @StateObject var provider = Meal.Provider()
    @State private var error: Network.Error?
    @State private var hasError = false
    let name: String
    let mealID: String
    
    var body: some View {
        NavigationStack {
            List {
                if let meal = provider.meal {
                    Photo(meal: meal)
                    Tags(meal: meal)
                    Instructions(meal: meal)
                    Ingredients(meal: meal)
                } else if let error {
                    Label(
                        error.errorDescription ?? "Error",
                        systemImage: "exclamationmark.triangle.fill"
                    )
                } else {
                    ProgressView()
                }
            }
            
            // MARK: Navigation Bar
            
            .navigationTitle(provider.meal?.name ?? name)
            .navigationBarTitleDisplayMode(.large)
            
            // MARK: Alerts
            
            .alert(
                isPresented: $hasError,
                error: error
            ) {}
        }
        .task {
            await fetch()
        }
    }
}

extension MealDetailScreen {
    
    func fetch() async {
        do {
            try await provider.fetch(mealID: mealID)
        } catch {
            self.error = error as? Network.Error ?? .unexpected(error: error)
            self.hasError = true
        }
    }
}

struct MealDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailScreen(
            provider: .init(
                client: .init(
                    downloader: Mock.HTTPDataDownloader.Meal.BananaPancakes()
                )
            ),
            name: "Banana Pancakes",
            mealID: "52855"
        )
    }
}
