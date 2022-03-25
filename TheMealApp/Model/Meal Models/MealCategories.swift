//
//  MealCategories.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/19/22.
//

import Foundation
import UIKit

enum MealCategories: String {
    case beef = "Beef"
    case chicken = "Chicken"
    case dessert = "Dessert"
    case pork = "Pork"
    case seafood = "Seafood"
    case vegetarian = "Vegetarian"
}

extension MealCategories {
    var image: UIImage {
        switch self {
            case .beef:
                return Icons.cow.image!
            case .chicken:
                return Icons.drumstick.image!
            case .dessert:
                return Icons.cake.image!
            case .pork:
                return Icons.pig.image!
            case .seafood:
                return Icons.fish.image!
            case .vegetarian:
                return Icons.seedling.image!
        }
    }
    
    static let categories: [MealCategories] = [
        .beef,
        chicken,
        dessert,
        pork,
        seafood,
        vegetarian
    ]
}

// Additonal Available MealCategories to be supported later:
//    case lamb = "Lamb"
//    case miscellaneous = "Miscellaneous"
//    case pasta = "Pasta"
//    case side = "Side"
//    case starter = "Starter"
//    case vegan = "Vegan"
//    case breakfast = "Breakfast"
//    case goat = "Goat"
