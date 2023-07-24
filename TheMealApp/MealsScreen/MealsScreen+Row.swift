//
//  MealsScreen+Row.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealsScreen {
    
    struct Row: View {
        
        let meal: Meals.Preview
        
        var body: some View {
            LabeledContent {
                Text(meal.name)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
            } label: {
                AsyncImage(url: meal.imageURL) { image in
                    image
                        .resizable()
                        .frame(
                            width: 80,
                            height: 80
                        )
                        .cornerRadius(8)
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .frame(
                            width: 80,
                            height: 80
                        )
                }
            }
        }
    }
}
