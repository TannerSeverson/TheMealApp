//
//  Mock+HTTPDataDownloader+Meal+BananaPancakes.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Mock.HTTPDataDownloader {
    enum Meal {}
}

extension Mock.HTTPDataDownloader.Meal {
    
    class BananaPancakes: TheMealApp.HTTPDataDownloader {
        func httpData(from url: URL) async throws -> Foundation.Data {
            try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
            return Mock.Data.Meal.bananaPancakes
        }
    }
}
