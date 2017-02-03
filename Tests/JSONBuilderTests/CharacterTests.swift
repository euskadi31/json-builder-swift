//
//  CharacterTests.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import XCTest
@testable import JSONBuilder

class CharacterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLowercased() {
        let c: Character = "A";

        XCTAssertEqual(c.lowercased(), "a")
    }

    func testPerformanceLowercased() {
        self.measure {
            let c: Character = "A"

            _ = c.lowercased()
        }
    }


    func testIsUpperCase() {
        let c: Character = "A";

        XCTAssertTrue(c.isUpperCase())

        XCTAssertFalse(c.lowercased().isUpperCase())
    }

    func testPerformanceIsUpperCase() {
        self.measure {
            let c: Character = "A";

            _ = c.isUpperCase()
        }
    }


    static var allTests : [(String, (CharacterTests) -> () throws -> Void)] {
        return [
            ("testLowercased", testLowercased),
            ("testIsUpperCase", testIsUpperCase)
        ]
    }

}
