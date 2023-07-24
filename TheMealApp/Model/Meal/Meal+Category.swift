//
//  Meal+Category.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

extension Meal {
    
    enum Category: String, Identifiable, CaseIterable {
        var id: Self { self }
        case beef
        case chicken
        case dessert
        case pork
        case seafood
        case vegetarian
    }
}

extension Meal.Category {
    
    var image: Image {
        switch self {
            case .beef:
                return Image("cow")
            case .chicken:
                return Image("drumstick")
            case .dessert:
                return Image("cake")
            case .pork:
                return Image("pig")
            case .seafood:
                return Image("fish")
            case .vegetarian:
                return Image("seedling")
        }
    }
}
