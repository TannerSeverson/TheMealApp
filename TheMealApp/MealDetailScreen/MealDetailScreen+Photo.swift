//
//  MealDetailScreen+Photo.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealDetailScreen {
    
    struct Photo: View {
        
        let meal: Meal
        
        var body: some View {
            Section {
                AsyncImage(url: meal.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .listRowInsets(
                    .init(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0
                    )
                )
            }
        }
    }
}

struct MealDetailScreen_Photo_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MealDetailScreen.Photo(
                meal: Mock.Model.bananaPancakes
            )
        }
    }
}
