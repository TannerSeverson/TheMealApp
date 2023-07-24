//
//  MealsScreen.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

struct MealsScreen: View {
    
    @EnvironmentObject var provider: Meals.Provider
    @State var category: Meal.Category = .dessert
    @State private var error: Network.Error?
    @State private var hasError = false
    
    var body: some View {
        NavigationStack {
            List(provider.meals) { meal in
                NavigationLink {
                    MealDetailScreen(
                        name: meal.name,
                        mealID: meal.id
                    )
                } label: {
                    Row(meal: meal)
                }
            }
            .refreshable {
                await fetch()
            }
            
            // MARK: Navigation Bar
            
            .navigationTitle(category.rawValue.capitalized)
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: toolbarContent)
            
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

extension MealsScreen {
    
    func fetch() async {
        do {
            try await provider.fetch(category: category)
        } catch {
            self.error = error as? Network.Error ?? .unexpected(error: error)
            self.hasError = true
        }
    }
}

struct MealsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealsScreen()
            .environmentObject(
                Meals.Provider(
                    client: Meals.Client(
                        downloader: Mock.HTTPDataDownloader.Meals.Dessert()
                    )
                )
            )
    }
}
