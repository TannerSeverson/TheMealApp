//
//  Meal+Client+Tests.swift
//  TheMealAppTests
//
//  Created by Tanner Severson on 7/23/23.
//

@testable import TheMealApp

import XCTest

final class Meal_Client_Test: XCTestCase {
    
    var sut: Meal.Client!
    
    override func setUpWithError() throws {
        sut = .init(downloader: Mock.HTTPDataDownloader.Meal.BananaPancakes())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_baseURL() throws {
        XCTAssertEqual(
            sut.baseURL,
            "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
        )
    }
    
    func test_meal_id() async throws {
        let meal = try await sut.meal(id: "52855")
        XCTAssertEqual(
            meal,
            Mock.Model.bananaPancakes
        )
    }
}
