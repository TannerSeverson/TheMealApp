//
//  Meal+Ingredients.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Meal {
    
    var ingredients: [String] {
        [
            ingredientWithMeasurement1,
            ingredientWithMeasurement2,
            ingredientWithMeasurement3,
            ingredientWithMeasurement4,
            ingredientWithMeasurement5,
            ingredientWithMeasurement6,
            ingredientWithMeasurement7,
            ingredientWithMeasurement8,
            ingredientWithMeasurement9,
            ingredientWithMeasurement10,
            ingredientWithMeasurement11,
            ingredientWithMeasurement12,
            ingredientWithMeasurement13,
            ingredientWithMeasurement14,
            ingredientWithMeasurement15,
            ingredientWithMeasurement16,
            ingredientWithMeasurement17,
            ingredientWithMeasurement18,
            ingredientWithMeasurement19,
            ingredientWithMeasurement20,
        ]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
    }
    
    private var ingredientWithMeasurement1: String {
        [
            measurement1,
            ingredient1
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement2: String {
        [
            measurement2,
            ingredient2
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement3: String {
        [
            measurement3,
            ingredient3
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement4: String {
        [
            measurement4,
            ingredient4
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement5: String {
        [
            measurement5,
            ingredient5
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement6: String {
        [
            measurement6,
            ingredient6
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement7: String {
        [
            measurement7,
            ingredient7
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement8: String {
        [
            measurement8,
            ingredient8
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement9: String {
        [
            measurement9,
            ingredient9
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement10: String {
        [
            measurement10,
            ingredient10
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement11: String {
        [
            measurement11,
            ingredient11
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement12: String {
        [
            measurement12,
            ingredient12
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement13: String {
        [
            measurement13,
            ingredient13
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement14: String {
        [
            measurement14,
            ingredient14
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement15: String {
        [
            measurement15,
            ingredient15
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement16: String {
        [
            measurement16,
            ingredient16
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement17: String {
        [
            measurement17,
            ingredient17
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement18: String {
        [
            measurement18,
            ingredient18
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement19: String {
        [
            measurement19,
            ingredient19
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    private var ingredientWithMeasurement20: String {
        [
            measurement20,
            ingredient20
        ]
            .compactMap { $0 }
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
