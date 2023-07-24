//
//  MealsScreen+Toolbar.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealsScreen {
    
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Menu {
                ForEach(Meal.Category.allCases) { category in
                    Button { self.category = category } label: {
                        Label { Text(category.rawValue) } icon: {
                            category.image
                        }
                    }
                }
            } label: {
                category.image
                    .accessibilityIdentifier("Menu")
            }
            .onChange(of: category) { _ in
                Task { @MainActor in
                    await fetch()
                }
            }
        }
    }
}
