//
//  Meal.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

struct Meal: Decodable, Identifiable, Equatable {
    
    let id: String?
    let name: String?
    let _category: String?
    let locale: String?
    let instructions: String?
    let _tags: String?
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measurement1: String?
    let measurement2: String?
    let measurement3: String?
    let measurement4: String?
    let measurement5: String?
    let measurement6: String?
    let measurement7: String?
    let measurement8: String?
    let measurement9: String?
    let measurement10: String?
    let measurement11: String?
    let measurement12: String?
    let measurement13: String?
    let measurement14: String?
    let measurement15: String?
    let measurement16: String?
    let measurement17: String?
    let measurement18: String?
    let measurement19: String?
    let measurement20: String?
    let _imageURL: String?
    let dateModified: String?
}

extension Meal {
    
    var category: Meal.Category? {
        guard let _category else { return nil }
        guard let category = Meal.Category(rawValue: _category) else { return nil }
        return category
    }
    
    var imageURL: URL? {
        guard let _imageURL else { return nil }
        return URL(string:  _imageURL)
    }
    
    var tags: [String] {
        guard let _tags else { return [] }
        return _tags.components(separatedBy: ",")
    }
}
