//
//  Meal+FromID.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meal {
    
    struct FromID: Decodable {
        
        let meals: [Meal]
    }
}
