//
//  MealsInCategory.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import Foundation

struct MealsInCategory: Codable {
    var name: String
    var imageURL: String
    var idMeal: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imageURL = "strMealThumb"
        case idMeal
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        idMeal = try values.decode(String.self, forKey: .idMeal)
        
    }
}
