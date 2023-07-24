//
//  MealDetailScreen+Instructions.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension MealDetailScreen {
    
    struct Instructions: View {
        
        let meal: Meal
        
        var body: some View {
            if let instructions = meal.instructions {
                Section {
                    Label {
                        Text("Instructions")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    } icon: {
                        Image("chef")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48)
                    }
                    Text(instructions)
                }
            }
        }
    }
}

struct MealDetailScreen_Instructions_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MealDetailScreen.Instructions(
                meal: Mock.Model.bananaPancakes
            )
        }
    }
}
