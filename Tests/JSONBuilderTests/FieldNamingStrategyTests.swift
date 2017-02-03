//
//  FieldNamingStrategyTests.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import XCTest
@testable import JSONBuilder

class FieldNamingStrategyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIdentityStrategy() {
        let strategy = IdentityStrategy()

        XCTAssertEqual(strategy.translateName(field: "someFieldName"), "someFieldName")
        XCTAssertEqual(strategy.translateName(field: "_someFieldName"), "_someFieldName")
        XCTAssertEqual(strategy.translateName(field: "aStringField"), "aStringField")
        XCTAssertEqual(strategy.translateName(field: "aURL"), "aURL")
        XCTAssertEqual(strategy.translateName(field: "Test"), "Test")
    }

    func testLowerCaseWithDashesStrategy() {
        let strategy = LowerCaseWithDashesStrategy()

        XCTAssertEqual(strategy.translateName(field: "someFieldName"), "some-field-name")
        XCTAssertEqual(strategy.translateName(field: "_someFieldName"), "_some-field-name")
        XCTAssertEqual(strategy.translateName(field: "aStringField"), "a-string-field")
        XCTAssertEqual(strategy.translateName(field: "aURL"), "a-u-r-l")
        XCTAssertEqual(strategy.translateName(field: "Test"), "test")
    }

    func testPerformanceLowerCaseWithDashesStrategy() {
        let strategy = LowerCaseWithDashesStrategy()

        self.measure {
            _ = strategy.translateName(field: "someFieldName")
            _ = strategy.translateName(field: "_someFieldName")
            _ = strategy.translateName(field: "aStringField")
            _ = strategy.translateName(field: "aURL")
            _ = strategy.translateName(field: "Test")
        }
    }

    func testLowerCaseWithUnderscoresStrategy() {
        let strategy = LowerCaseWithUnderscoresStrategy()

        XCTAssertEqual(strategy.translateName(field: "someFieldName"), "some_field_name")
        XCTAssertEqual(strategy.translateName(field: "_someFieldName"), "_some_field_name")
        XCTAssertEqual(strategy.translateName(field: "aStringField"), "a_string_field")
        XCTAssertEqual(strategy.translateName(field: "aURL"), "a_u_r_l")
        XCTAssertEqual(strategy.translateName(field: "Test"), "test")
    }

    func testPerformanceLowerCaseWithUnderscoresStrategy() {
        let strategy = LowerCaseWithUnderscoresStrategy()

        self.measure {
            _ = strategy.translateName(field: "someFieldName")
            _ = strategy.translateName(field: "_someFieldName")
            _ = strategy.translateName(field: "aStringField")
            _ = strategy.translateName(field: "aURL")
            _ = strategy.translateName(field: "Test")
        }
    }

    func testUpperCamelCaseWithSpacesStrategy() {
        let strategy = UpperCamelCaseWithSpacesStrategy()

        XCTAssertEqual(strategy.translateName(field: "someFieldName"), "Some Field Name")
        XCTAssertEqual(strategy.translateName(field: "_someFieldName"), "_Some Field Name")
        XCTAssertEqual(strategy.translateName(field: "Test"), "Test")
    }

    func testPerformanceUpperCamelCaseWithSpacesStrategy() {
        let strategy = UpperCamelCaseWithSpacesStrategy()

        self.measure {
            _ = strategy.translateName(field: "someFieldName")
            _ = strategy.translateName(field: "_someFieldName")
            _ = strategy.translateName(field: "Test")
        }
    }

    func testUpperCamelCaseStrategy() {
        let strategy = UpperCamelCaseStrategy()

        XCTAssertEqual(strategy.translateName(field: "someFieldName"), "SomeFieldName")
        XCTAssertEqual(strategy.translateName(field: "_someFieldName"), "_SomeFieldName")
        XCTAssertEqual(strategy.translateName(field: "Test"), "Test")
    }


    func testPerformanceUpperCamelCaseStrategy() {
        let strategy = UpperCamelCaseStrategy()

        self.measure {
            _ = strategy.translateName(field: "someFieldName")
            _ = strategy.translateName(field: "_someFieldName")
            _ = strategy.translateName(field: "Test")
        }
    }

    static var allTests : [(String, (FieldNamingStrategyTests) -> () throws -> Void)] {
        return [
            ("testIdentityStrategy", testIdentityStrategy),
            ("testLowerCaseWithDashesStrategy", testLowerCaseWithDashesStrategy),
            ("testLowerCaseWithUnderscoresStrategy", testLowerCaseWithUnderscoresStrategy),
            ("testUpperCamelCaseWithSpacesStrategy", testUpperCamelCaseWithSpacesStrategy),
            ("testUpperCamelCaseStrategy", testUpperCamelCaseStrategy)
        ]
    }

}
