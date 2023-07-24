//
//  Meal+Decoder+Test.swift
//  TheMealAppTests
//
//  Created by Tanner Severson on 7/23/23.
//

@testable import TheMealApp

import XCTest

final class Meal_Decoder_Test: XCTestCase {
    
    var sut: Meal!
    
    override func setUpWithError() throws {
        sut = try XCTUnwrap(
            try JSONDecoder().decode(Meal.FromID.self, from: Mock.Data.Meal.bananaPancakes).meals.first
        )
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Match() throws {
        XCTAssertEqual(
            sut,
            Mock.Model.bananaPancakes
        )
    }
    
    func test_id() throws {
        XCTAssertEqual(
            sut.id,
            Mock.Model.bananaPancakes.id
        )
    }
    
    func test_name() throws {
        XCTAssertEqual(
            sut.name,
            Mock.Model.bananaPancakes.name
        )
    }
    
    func test__category() throws {
        XCTAssertEqual(
            sut._category,
            Mock.Model.bananaPancakes._category
        )
    }
    
    func test_locale() throws {
        XCTAssertEqual(
            sut.locale,
            Mock.Model.bananaPancakes.locale
        )
    }
    
    func test_instructions() throws {
        XCTAssertEqual(
            sut.instructions,
            Mock.Model.bananaPancakes.instructions
        )
    }
    
    func test__tags() throws {
        XCTAssertEqual(
            sut._tags,
            Mock.Model.bananaPancakes._tags
        )
    }
    
    func test_ingredient1() throws {
        XCTAssertEqual(
            sut.ingredient1,
            Mock.Model.bananaPancakes.ingredient1
        )
    }
    
    func test_ingredient2() throws {
        XCTAssertEqual(
            sut.ingredient2,
            Mock.Model.bananaPancakes.ingredient2
        )
    }
    
    func test_ingredient3() throws {
        XCTAssertEqual(
            sut.ingredient3,
            Mock.Model.bananaPancakes.ingredient3
        )
    }
    
    func test_ingredient4() throws {
        XCTAssertEqual(
            sut.ingredient4,
            Mock.Model.bananaPancakes.ingredient4
        )
    }
    
    func test_ingredient5() throws {
        XCTAssertEqual(
            sut.ingredient5,
            Mock.Model.bananaPancakes.ingredient5
        )
    }
    
    func test_ingredient6() throws {
        XCTAssertEqual(
            sut.ingredient6,
            Mock.Model.bananaPancakes.ingredient6
        )
    }
    
    func test_ingredient7() throws {
        XCTAssertEqual(
            sut.ingredient7,
            Mock.Model.bananaPancakes.ingredient7
        )
    }
    
    func test_ingredient8() throws {
        XCTAssertEqual(
            sut.ingredient8,
            Mock.Model.bananaPancakes.ingredient8
        )
    }
    
    func test_ingredient9() throws {
        XCTAssertEqual(
            sut.ingredient9,
            Mock.Model.bananaPancakes.ingredient9
        )
    }
    
    func test_ingredient10() throws {
        XCTAssertEqual(
            sut.ingredient10,
            Mock.Model.bananaPancakes.ingredient10
        )
    }
    
    func test_ingredient11() throws {
        XCTAssertEqual(
            sut.ingredient11,
            Mock.Model.bananaPancakes.ingredient11
        )
    }
    
    func test_ingredient12() throws {
        XCTAssertEqual(
            sut.ingredient12,
            Mock.Model.bananaPancakes.ingredient12
        )
    }
    
    func test_ingredient13() throws {
        XCTAssertEqual(
            sut.ingredient13,
            Mock.Model.bananaPancakes.ingredient13
        )
    }
    
    func test_ingredient14() throws {
        XCTAssertEqual(
            sut.ingredient14,
            Mock.Model.bananaPancakes.ingredient14
        )
    }
    
    func test_ingredient15() throws {
        XCTAssertEqual(
            sut.ingredient15,
            Mock.Model.bananaPancakes.ingredient15
        )
    }
    
    func test_ingredient16() throws {
        XCTAssertEqual(
            sut.ingredient16,
            Mock.Model.bananaPancakes.ingredient16
        )
    }
    
    func test_ingredient17() throws {
        XCTAssertEqual(
            sut.ingredient17,
            Mock.Model.bananaPancakes.ingredient17
        )
    }
    
    func test_ingredient18() throws {
        XCTAssertEqual(
            sut.ingredient18,
            Mock.Model.bananaPancakes.ingredient18
        )
    }
    
    func test_ingredient19() throws {
        XCTAssertEqual(
            sut.ingredient19,
            Mock.Model.bananaPancakes.ingredient19
        )
    }
    
    func test_ingredient20() throws {
        XCTAssertEqual(
            sut.ingredient20,
            Mock.Model.bananaPancakes.ingredient20
        )
    }
    
    func test_measurement1() throws {
        XCTAssertEqual(
            sut.measurement1,
            Mock.Model.bananaPancakes.measurement1
        )
    }
    
    func test_measurement2() throws {
        XCTAssertEqual(
            sut.measurement2,
            Mock.Model.bananaPancakes.measurement2
        )
    }
    
    func test_measurement3() throws {
        XCTAssertEqual(
            sut.measurement3,
            Mock.Model.bananaPancakes.measurement3
        )
    }
    
    func test_measurement4() throws {
        XCTAssertEqual(
            sut.measurement4,
            Mock.Model.bananaPancakes.measurement4
        )
    }
    
    func test_measurement5() throws {
        XCTAssertEqual(
            sut.measurement5,
            Mock.Model.bananaPancakes.measurement5
        )
    }
    
    func test_measurement6() throws {
        XCTAssertEqual(
            sut.measurement6,
            Mock.Model.bananaPancakes.measurement6
        )
    }
    
    func test_measurement7() throws {
        XCTAssertEqual(
            sut.measurement7,
            Mock.Model.bananaPancakes.measurement7
        )
    }
    
    func test_measurement8() throws {
        XCTAssertEqual(
            sut.measurement8,
            Mock.Model.bananaPancakes.measurement8
        )
    }
    
    func test_measurement9() throws {
        XCTAssertEqual(
            sut.measurement9,
            Mock.Model.bananaPancakes.measurement9
        )
    }
    
    func test_measurement10() throws {
        XCTAssertEqual(
            sut.measurement10,
            Mock.Model.bananaPancakes.measurement10
        )
    }
    
    func test_measurement11() throws {
        XCTAssertEqual(
            sut.measurement11,
            Mock.Model.bananaPancakes.measurement11
        )
    }
    
    func test_measurement12() throws {
        XCTAssertEqual(
            sut.measurement12,
            Mock.Model.bananaPancakes.measurement12
        )
    }
    
    func test_measurement13() throws {
        XCTAssertEqual(
            sut.measurement13,
            Mock.Model.bananaPancakes.measurement13
        )
    }
    
    func test_measurement14() throws {
        XCTAssertEqual(
            sut.measurement14,
            Mock.Model.bananaPancakes.measurement14
        )
    }
    
    func test_measurement15() throws {
        XCTAssertEqual(
            sut.measurement15,
            Mock.Model.bananaPancakes.measurement15
        )
    }
    
    func test_measurement16() throws {
        XCTAssertEqual(
            sut.measurement16,
            Mock.Model.bananaPancakes.measurement16
        )
    }
    
    func test_measurement17() throws {
        XCTAssertEqual(
            sut.measurement17,
            Mock.Model.bananaPancakes.measurement17
        )
    }
    
    func test_measurement18() throws {
        XCTAssertEqual(
            sut.measurement18,
            Mock.Model.bananaPancakes.measurement18
        )
    }
    
    func test_measurement19() throws {
        XCTAssertEqual(
            sut.measurement19,
            Mock.Model.bananaPancakes.measurement19
        )
    }
    
    func test_measurement20() throws {
        XCTAssertEqual(
            sut.measurement20,
            Mock.Model.bananaPancakes.measurement20
        )
    }
    
    func test__imageURL() throws {
        XCTAssertEqual(
            sut._imageURL,
            Mock.Model.bananaPancakes._imageURL
        )
    }
    
    func test_dateModified() throws {
        XCTAssertEqual(
            sut.dateModified,
            Mock.Model.bananaPancakes.dateModified
        )
    }
}
