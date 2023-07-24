//
//  TheMealAppUITests.swift
//  TheMealAppUITests
//
//  Created by Tanner Severson on 7/23/23.
//

import XCTest

final class TheMealAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app = nil
    }
    
    func test_Menu() throws {
        app.launch()
        print(app.debugDescription)
        app.navigationBars["Dessert"].otherElements["Menu"].tap()
        XCTAssert(app.collectionViews.buttons["beef"].exists)
        XCTAssert(app.collectionViews.buttons["chicken"].exists)
        XCTAssert(app.collectionViews.buttons["dessert"].exists)
        XCTAssert(app.collectionViews.buttons["pork"].exists)
        XCTAssert(app.collectionViews.buttons["seafood"].exists)
        XCTAssert(app.collectionViews.buttons["vegetarian"].exists)
    }
    
    func test_switchToChicken() throws {
        app.launch()
        app.navigationBars["Dessert"].otherElements["Menu"].tap()
        app.collectionViews.buttons["chicken"].tap()
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Chick-Fil-A Sandwich"]/*[[".cells",".buttons[\"Chick-Fil-A Sandwich\"].staticTexts[\"Chick-Fil-A Sandwich\"]",".staticTexts[\"Chick-Fil-A Sandwich\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.waitForExistence(timeout: 2))
    }
    
    func test_ApamBalik() throws {
        app.launch()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Apam balik"]/*[[".cells",".buttons[\"Apam balik\"].staticTexts[\"Apam balik\"]",".staticTexts[\"Apam balik\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Instructions"]/*[[".cells.staticTexts[\"Instructions\"]",".staticTexts[\"Instructions\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Ingredients"]/*[[".cells.staticTexts[\"Ingredients\"]",".staticTexts[\"Ingredients\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["200ml Milk"]/*[[".cells.staticTexts[\"200ml Milk\"]",".staticTexts[\"200ml Milk\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["60ml Oil"]/*[[".cells.staticTexts[\"60ml Oil\"]",".staticTexts[\"60ml Oil\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["2 Eggs"]/*[[".cells.staticTexts[\"2 Eggs\"]",".staticTexts[\"2 Eggs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["2 Eggs"]/*[[".cells.staticTexts[\"2 Eggs\"]",".staticTexts[\"2 Eggs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["1600g Flour"]/*[[".cells.staticTexts[\"1600g Flour\"]",".staticTexts[\"1600g Flour\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["3 tsp Baking Powder"]/*[[".cells.staticTexts[\"3 tsp Baking Powder\"]",".staticTexts[\"3 tsp Baking Powder\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["1/2 tsp Salt"]/*[[".cells.staticTexts[\"1\/2 tsp Salt\"]",".staticTexts[\"1\/2 tsp Salt\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["25g Unsalted Butter"]/*[[".cells.staticTexts[\"25g Unsalted Butter\"]",".staticTexts[\"25g Unsalted Butter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["45g Sugar"]/*[[".cells.staticTexts[\"45g Sugar\"]",".staticTexts[\"45g Sugar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        XCTAssert(app.collectionViews/*@START_MENU_TOKEN@*/.staticTexts["3 tbs Peanut Butter"]/*[[".cells.staticTexts[\"3 tbs Peanut Butter\"]",".staticTexts[\"3 tbs Peanut Butter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
    }
}
