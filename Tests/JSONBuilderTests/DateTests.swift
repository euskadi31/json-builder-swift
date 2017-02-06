//
//  DateTests.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import XCTest

class DateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJSONSerializable() {
        let date = Date(timeIntervalSince1970: 5)

        XCTAssertEqual(date.jsonSerialize() as! String, "1970-01-01T00:00:05+0000")
    }

    func testPerformanceJSONSerializable() {
        self.measure {
            let date = Date(timeIntervalSince1970: 5)
            _ = date.jsonSerialize()
        }
    }

    static var allTests : [(String, (DateTests) -> () throws -> Void)] {
        return [
            ("testJSONSerializable", testJSONSerializable)
        ]
    }

}
