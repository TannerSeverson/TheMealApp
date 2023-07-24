//
//  Meals.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

struct Meals: Decodable {
    
    let meals: [Meals.Preview]
}

extension Meals {
    
    struct Preview: Decodable, Identifiable, Equatable {
        
        var id: String
        var name: String
        var _imageURL: String
        
        enum CodingKeys: String, CodingKey {
            case name = "strMeal"
            case _imageURL = "strMealThumb"
            case id = "idMeal"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(String.self, forKey: .id)
            name = try values.decode(String.self, forKey: .name)
            _imageURL = try values.decode(String.self, forKey: ._imageURL)
        }
        
        var imageURL: URL? {
            URL(string:  _imageURL)
        }
    }
}
