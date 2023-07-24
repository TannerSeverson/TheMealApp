//
//  Meal+Decoder.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meal {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decode(String.self, forKey: .id)
        name = try? values.decode(String.self, forKey: .name)
        _category = try? values.decode(String.self, forKey: ._category)
        locale = try? values.decode(String.self, forKey: .locale)
        instructions = try? values.decode(String.self, forKey: .instructions)
        _tags = try? values.decode(String.self, forKey: ._tags)
        ingredient1 = try? values.decode(String.self, forKey: .ingredient1)
        ingredient2 = try? values.decode(String.self, forKey: .ingredient2)
        ingredient3 = try? values.decode(String.self, forKey: .ingredient3)
        ingredient4 = try? values.decode(String.self, forKey: .ingredient4)
        ingredient5 = try? values.decode(String.self, forKey: .ingredient5)
        ingredient6 = try? values.decode(String.self, forKey: .ingredient6)
        ingredient7 = try? values.decode(String.self, forKey: .ingredient7)
        ingredient8 = try? values.decode(String.self, forKey: .ingredient8)
        ingredient9 = try? values.decode(String.self, forKey: .ingredient9)
        ingredient10 = try? values.decode(String.self, forKey: .ingredient10)
        ingredient11 = try? values.decode(String.self, forKey: .ingredient11)
        ingredient12 = try? values.decode(String.self, forKey: .ingredient12)
        ingredient13 = try? values.decode(String.self, forKey: .ingredient13)
        ingredient14 = try? values.decode(String.self, forKey: .ingredient14)
        ingredient15 = try? values.decode(String.self, forKey: .ingredient15)
        ingredient16 = try? values.decode(String.self, forKey: .ingredient16)
        ingredient17 = try? values.decode(String.self, forKey: .ingredient17)
        ingredient18 = try? values.decode(String.self, forKey: .ingredient18)
        ingredient19 = try? values.decode(String.self, forKey: .ingredient19)
        ingredient20 = try? values.decode(String.self, forKey: .ingredient20)
        measurement1 = try? values.decode(String.self, forKey: .measurement1)
        measurement2 = try? values.decode(String.self, forKey: .measurement2)
        measurement3 = try? values.decode(String.self, forKey: .measurement3)
        measurement4 = try? values.decode(String.self, forKey: .measurement4)
        measurement5 = try? values.decode(String.self, forKey: .measurement5)
        measurement6 = try? values.decode(String.self, forKey: .measurement6)
        measurement7 = try? values.decode(String.self, forKey: .measurement7)
        measurement8 = try? values.decode(String.self, forKey: .measurement8)
        measurement9 = try? values.decode(String.self, forKey: .measurement9)
        measurement10 = try? values.decode(String.self, forKey: .measurement10)
        measurement11 = try? values.decode(String.self, forKey: .measurement11)
        measurement12 = try? values.decode(String.self, forKey: .measurement12)
        measurement13 = try? values.decode(String.self, forKey: .measurement13)
        measurement14 = try? values.decode(String.self, forKey: .measurement14)
        measurement15 = try? values.decode(String.self, forKey: .measurement15)
        measurement16 = try? values.decode(String.self, forKey: .measurement16)
        measurement17 = try? values.decode(String.self, forKey: .measurement17)
        measurement18 = try? values.decode(String.self, forKey: .measurement18)
        measurement19 = try? values.decode(String.self, forKey: .measurement19)
        measurement20 = try? values.decode(String.self, forKey: .measurement20)
        _imageURL = try? values.decode(String.self, forKey: ._imageURL)
        dateModified = try? values.decode(String.self, forKey: .dateModified)
    }
}
