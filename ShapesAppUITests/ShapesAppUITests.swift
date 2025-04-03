//
//  ShapesAppUITests.swift
//  ShapesAppUITests
//
//  Created by Madhusudhan on 01/04/25.
//

import XCTest

final class ShapesAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testAddingShapes() {
        let circleButton = app.buttons["Circle"]
        let squareButton = app.buttons["Square"]
        let triangleButton = app.buttons["Triangle"]
        
        XCTAssert(circleButton.exists)
        XCTAssert(squareButton.exists)
        XCTAssert(triangleButton.exists)
        
        circleButton.tap()
        squareButton.tap()
        triangleButton.tap()
        
        sleep(1)

        let shapeViews = app.otherElements.matching(identifier: "ShapeView")
        XCTAssertEqual(shapeViews.count, 3)
    }
    
    func testAddingCircles() {
        let circleButton = app.buttons["Circle"]
        
        XCTAssert(circleButton.exists)
        
        circleButton.tap()
        circleButton.tap()
        
        sleep(1)
        
        let circles = app.otherElements.matching(identifier: "ShapeView")
        XCTAssertEqual(circles.count, 2)
    }
    
    func testAddingTriangle() {
        let triangleButton = app.buttons["Triangle"]
        
        XCTAssert(triangleButton.exists)
        
        triangleButton.tap()
        triangleButton.tap()
        
        sleep(1)
        
        let triangles = app.otherElements.matching(identifier: "ShapeView")
        XCTAssertEqual(triangles.count, 2)
    }
    
    func testClearShapes() {
        let clearButton = app.buttons["Clear All"]
        XCTAssert(clearButton.exists)
        
        app.buttons["Circle"].tap()
        app.buttons["Square"].tap()
        XCTAssertGreaterThan(app.otherElements.count, 0)
        
        clearButton.tap()
        XCTAssertEqual(app.otherElements.containing(.other, identifier: "ShapeView").count, 0)
    }
    
    func testEditCirclesScreen() {
        let editCirclesButton = app.buttons["Edit Circles"]
        XCTAssert(editCirclesButton.exists)
        
        editCirclesButton.tap()
        
        let addButton = app.buttons["Add"]
        let removeButton = app.buttons["Remove"]
        let deleteAllButton = app.buttons["Delete All"]

        XCTAssert(addButton.exists)
        XCTAssert(removeButton.exists)
        XCTAssert(deleteAllButton.exists)

        addButton.tap()
        addButton.tap()

        // Wait for UI update
        sleep(1)

        let circles = app.otherElements.matching(identifier: "EditCircleView")
        XCTAssertEqual(circles.count, 2)

        removeButton.tap()
        XCTAssertEqual(app.otherElements.matching(identifier: "EditCircleView").count, 1)

        deleteAllButton.tap()
        XCTAssertEqual(app.otherElements.matching(identifier: "EditCircleView").count, 0)
    }
}
