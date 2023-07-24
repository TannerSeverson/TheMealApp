//
//  Mock+HTTPDataDownloader+Meals+Dessert.swift
//  TheMealApp
//
//  Created by Tanner Severson on 7/23/23.
//

import Foundation

extension Mock.HTTPDataDownloader {
    enum Meals {}
}

extension Mock.HTTPDataDownloader.Meals {
    
    class Dessert: TheMealApp.HTTPDataDownloader {
        func httpData(from url: URL) async throws -> Foundation.Data {
            try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
            return Mock.Data.Meals.dessert
        }
    }
}
