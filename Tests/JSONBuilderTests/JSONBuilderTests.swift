//
//  JSONBuilderTests.swift
//  JSONBuilder
//
//  Created by Axel Etcheverry on 03/02/2017.
//
//

import XCTest
@testable import JSONBuilder

struct User {
    var Id: Int?
    var Score: Double?
    var FirstName: String?
    var List: Array<String>?
    var Labels: Dictionary<String, String>?
    var IsAdmin: Bool
    var Nullable: String?
}

class JSONBuilderTests: XCTestCase {
    func testDefaultBuilder() {
        let u = User(Id: 1, Score: 4.5, FirstName: "Axel", List: ["foo", "bar"], Labels: ["foo": "bar"], IsAdmin: true, Nullable: nil)

        XCTAssertEqual(JSONBuilder().serialize(object: u), "{\"FirstName\":\"Axel\",\"Labels\":{\"foo\":\"bar\"},\"IsAdmin\":true,\"Score\":4.5,\"List\":[\"foo\",\"bar\"],\"Id\":1}")
    }

    func testBuilderWithLowerCaseWithUnderscoresStrategy() {
        let u = User(Id: 1, Score: 4.5, FirstName: "Axel", List: ["foo", "bar"], Labels: ["foo": "bar"], IsAdmin: true, Nullable: nil)

        XCTAssertEqual(JSONBuilder(policy: .lowerCaseWithUnderscores).serialize(object: u), "{\"list\":[\"foo\",\"bar\"],\"labels\":{\"foo\":\"bar\"},\"is_admin\":true,\"score\":4.5,\"id\":1,\"first_name\":\"Axel\"}")
    }


    func testBuilderWithNullObject() {
        XCTAssertNil(JSONBuilder().serialize(object: nil))
    }

    func testBuilderWithBadObject() {
        XCTAssertNil(JSONBuilder().serialize(object: 153))
    }

    static var allTests : [(String, (JSONBuilderTests) -> () throws -> Void)] {
        return [
            ("testDefaultBuilder", testDefaultBuilder),
            ("testBuilderWithLowerCaseWithUnderscoresStrategy", testBuilderWithLowerCaseWithUnderscoresStrategy),
            ("testBuilderWithNullObject", testBuilderWithNullObject),
            ("testBuilderWithBadObject", testBuilderWithBadObject)
        ]
    }
}
