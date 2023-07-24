//
//  MealDetailScreen+Tags.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealDetailScreen {
    
    struct Tags: View {
        
        let meal: Meal
        
        var body: some View {
            if !first3Tags.isEmpty {
                Section {
                    ForEach(first3Tags, id: \.self) { tag in
                        Label {
                            Text(tag)
                        } icon: {
                            Image("tag")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
        }
    }
}

extension MealDetailScreen.Tags {
    
    var first3Tags: [String] {
        Array(
            meal.tags
                .sorted()
                .prefix(3)
        )
    }
}

struct MealDetailScreen_Tags_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MealDetailScreen.Tags(
                meal: Mock.Model.bananaPancakes
            )
        }
    }
}
