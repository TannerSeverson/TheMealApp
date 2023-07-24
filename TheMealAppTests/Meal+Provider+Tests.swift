//
//  Meal+Provider+Tests.swift
//  TheMealAppTests
//
//  Created by Tanner Severson on 7/23/23.
//

@testable import TheMealApp

import XCTest

final class Meal_Provider_Test: XCTestCase {
    
    var sut: Meal.Provider!
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    @MainActor
    func test_Successful_fetch() async throws {
        let client = Meal.Client(downloader: Mock.HTTPDataDownloader.Meal.BananaPancakes())
        sut = .init(client: client)
        XCTAssertEqual(
            sut.meal,
            nil
        )
        try await sut.fetch(mealID: "52855")
        XCTAssertEqual(
            sut.meal,
            Mock.Model.bananaPancakes
        )
    }
    
    @MainActor
    func test_Failure_fetch() async throws {
        let client = Meal.Client(downloader: Mock.HTTPDataDownloader.Failure())
        sut = .init(client: client)
        XCTAssertEqual(
            sut.meal,
            nil
        )
        do {
            try await sut.fetch(mealID: "52855")
            XCTFail("Call should result in an error")
        } catch {
            XCTAssertNotNil(error)
        }
        XCTAssertEqual(
            sut.meal,
            nil
        )
    }
}
