//
//  TheMealAppApp.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import SwiftUI

@main
struct TheMealAppApp: App {
    
    @StateObject var mealsProvider = Meals.Provider()
    
    var body: some Scene {
        WindowGroup {
            MealsScreen()
                .environmentObject(mealsProvider)
        }
    }
}
