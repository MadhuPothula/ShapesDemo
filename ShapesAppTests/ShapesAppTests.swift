//
//  ShapesAppTests.swift
//  ShapesAppTests
//
//  Created by Madhusudhan on 01/04/25.
//

import XCTest
@testable import ShapesApp

final class ShapesAppTests: XCTestCase {
    
    var viewModel: ShapesViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ShapesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchingShapes() {
        let jsonData = """
            {
                "buttons": [
                    { "name": "Circle", "draw_path": "circle" },
                    { "name": "Square", "draw_path": "square" },
                    { "name": "Triangle", "draw_path": "triangle" }
                ]
            }
            """.data(using: .utf8)!
        
        do {
            let decodedData = try JSONDecoder().decode([String: [ShapeButton]].self, from: jsonData)
            XCTAssertEqual(decodedData["buttons"]?.count, 3, "Expected 3 shape buttons")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
    
    func testAddingShapes() {
        viewModel.addShape("circle")
        XCTAssertEqual(viewModel.shapes.count, 1)
        XCTAssertEqual(viewModel.shapes.first?.type, "circle")
    }
    
    func testClearingShapes() {
        viewModel.addShape("square")
        viewModel.addShape("triangle")
        XCTAssertEqual(viewModel.shapes.count, 2)
        
        viewModel.clearShapes()
        XCTAssertEqual(viewModel.shapes.count, 0)
    }
    
    func testAddingCircleInEditScreen() {
        viewModel.addShape("circle")
        XCTAssertEqual(viewModel.shapes.count, 1)
        XCTAssertEqual(viewModel.shapes.first?.type, "circle")
    }

    func testRemovingLastCircle() {
        viewModel.addShape("circle")
        viewModel.addShape("square")
        viewModel.addShape("circle")

        if let index = viewModel.shapes.lastIndex(where: { $0.type == "circle" }) {
            viewModel.shapes.remove(at: index)
        }
        
        XCTAssertEqual(viewModel.shapes.count, 2)
    }

    func testDeleteAllCircles() {
        viewModel.addShape("circle")
        viewModel.addShape("circle")
        viewModel.addShape("square")

        viewModel.shapes.removeAll(where: { $0.type == "circle" })

        XCTAssertEqual(viewModel.shapes.count, 1)
        XCTAssertFalse(viewModel.shapes.contains { $0.type == "circle" })
    }
}
