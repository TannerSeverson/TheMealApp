//
//  MealDetailScreen+Ingredients.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealDetailScreen {
    
    struct Ingredients: View {
        
        let meal: Meal
        
        var body: some View {
            Section {
                Label {
                    Text("Ingredients")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } icon: {
                    Image("memo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                }
                
                ForEach(meal.ingredients, id: \.self) { ingredient in
                    Label {
                        Text(ingredient)
                    } icon: {
                        Image("dot")
                    }
                }
            }
        }
    }
}

struct MealDetailScreen_Ingredients_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MealDetailScreen.Ingredients(
                meal: Mock.Model.bananaPancakes
            )
        }
    }
}
