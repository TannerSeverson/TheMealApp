//
//  Meal.swift
//  TheMealApp
//
//  Created by Tanner Severson on 3/16/22.
//

import Foundation

struct MealsByID: Codable {
    let meals: [MealByID]
}

struct MealByID: Codable {
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
}


extension MealByID {
    func createRenderableMeal() -> RenderableMeal {
        let name = strMeal ?? "The Meal has no name! Be the first to name it!"
        let ingredients = returnIngredients()
        let imageURL = strMealThumb
        let instructions = strInstructions ?? "This Meal has no instructions posted!"
        return RenderableMeal (name: name, instructions: instructions, ingredients: ingredients, imageURL: imageURL)
    }
}


extension MealByID {
    
    // Get an array of all measures
    func returnIngredients() -> [String] {
        let measures = [
            strMeasure1,
            strMeasure2,
            strMeasure3,
            strMeasure4,
            strMeasure5,
            strMeasure6,
            strMeasure7,
            strMeasure8,
            strMeasure9,
            strMeasure10,
            strMeasure11,
            strMeasure12,
            strMeasure13,
            strMeasure14,
            strMeasure15,
            strMeasure16,
            strMeasure17,
            strMeasure18,
            strMeasure19,
            strMeasure20,
        ]
        // Remove empty values from the array
        let measuresCompact = measures.compactMap {$0} .filter{ !$0.isEmpty }
        
        // Get an array of all measures
        let ingredients = [
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15,
            strIngredient16,
            strIngredient17,
            strIngredient18,
            strIngredient19,
            strIngredient20,
        ]
        // Remove empty values from the array
        let ingredientsCompact = ingredients.compactMap {$0} .filter{ !$0.isEmpty }
        
        // Combine the n positon for each aray into a tuple
        // Note: Both arrays *should* be the same length. However proper error handling in the case that they are different lengths should be added
        let combined = Array(zip(measuresCompact, ingredientsCompact))
        
        // Map the array of tuples into an array of strings
        let mapped = combined.map { $0.0 + " " + $0.1 }
        return mapped
    }
    
}
