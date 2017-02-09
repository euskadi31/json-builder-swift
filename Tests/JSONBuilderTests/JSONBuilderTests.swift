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
    var Labels: Dictionary<String, String?>?
    var IsAdmin: Bool
    var Nullable: String?
    var CreatedAt: Date?
    var Roles: Array<Role>?
}

struct Role {
    var name: String?
}

struct Author {
    var id: Int?
}

struct Article {
    var id: Int?
    var author: Author?
}

class JSONBuilderTests: XCTestCase {

    func testDefaultBuilder() {
        let u = User(
            Id: 1,
            Score: 4.5,
            FirstName: "Axel",
            List: ["foo", "bar"],
            Labels: ["foo": "bar", "null": nil],
            IsAdmin: true,
            Nullable: nil,
            CreatedAt: Date(timeIntervalSince1970: 150),
            Roles: [Role(name: "USER"), Role(name: "ADMIN")]
        )

        XCTAssertEqual(JSONBuilder().serialize(object: u), "{\"FirstName\":\"Axel\",\"Labels\":{\"null\":null,\"foo\":\"bar\"},\"IsAdmin\":true,\"List\":[\"foo\",\"bar\"],\"Nullable\":null,\"CreatedAt\":\"1970-01-01T00:02:30+0000\",\"Roles\":[{\"name\":\"USER\"},{\"name\":\"ADMIN\"}],\"Score\":4.5,\"Id\":1}")
    }

    func testBuilderWithLowerCaseWithUnderscoresStrategy() {
        let u = User(
            Id: 1,
            Score: 4.5,
            FirstName: "Axel",
            List: ["foo", "bar"],
            Labels: ["foo": "bar"],
            IsAdmin: true,
            Nullable: nil,
            CreatedAt: Date(timeIntervalSince1970: 150),
            Roles: [Role(name: "USER"), Role(name: "ADMIN")]
        )

        XCTAssertEqual(JSONBuilder(policy: .lowerCaseWithUnderscores).serialize(object: u), "{\"is_admin\":true,\"labels\":{\"foo\":\"bar\"},\"nullable\":null,\"score\":4.5,\"id\":1,\"first_name\":\"Axel\",\"roles\":[{\"name\":\"USER\"},{\"name\":\"ADMIN\"}],\"created_at\":\"1970-01-01T00:02:30+0000\",\"list\":[\"foo\",\"bar\"]}")
    }

    func testBuilderWithLowerCaseWithDashesStrategy() {
        let u = User(
            Id: 1,
            Score: 4.5,
            FirstName: "Axel",
            List: ["foo", "bar"],
            Labels: ["foo": "bar"],
            IsAdmin: true,
            Nullable: nil,
            CreatedAt: Date(timeIntervalSince1970: 150),
            Roles: [Role(name: "USER"), Role(name: "ADMIN")]
        )

        XCTAssertEqual(JSONBuilder(policy: .lowerCaseWithDashes).serialize(object: u), "{\"labels\":{\"foo\":\"bar\"},\"nullable\":null,\"first-name\":\"Axel\",\"id\":1,\"score\":4.5,\"is-admin\":true,\"roles\":[{\"name\":\"USER\"},{\"name\":\"ADMIN\"}],\"list\":[\"foo\",\"bar\"],\"created-at\":\"1970-01-01T00:02:30+0000\"}")
    }

    func testBuilderWithUpperCamelCaseStrategy() {
        let u = User(
            Id: 1,
            Score: 4.5,
            FirstName: "Axel",
            List: ["foo", "bar"],
            Labels: ["foo": "bar"],
            IsAdmin: true,
            Nullable: nil,
            CreatedAt: Date(timeIntervalSince1970: 150),
            Roles: [Role(name: "USER"), Role(name: "ADMIN")]
        )

        XCTAssertEqual(JSONBuilder(policy: .upperCamelCase).serialize(object: u), "{\"FirstName\":\"Axel\",\"Labels\":{\"Foo\":\"bar\"},\"IsAdmin\":true,\"List\":[\"foo\",\"bar\"],\"Nullable\":null,\"CreatedAt\":\"1970-01-01T00:02:30+0000\",\"Roles\":[{\"Name\":\"USER\"},{\"Name\":\"ADMIN\"}],\"Score\":4.5,\"Id\":1}")
    }
    
    func testBuilderWithUpperCamelCaseWithSpacesStrategy() {
        let u = User(
            Id: 1,
            Score: 4.5,
            FirstName: "Axel",
            List: ["foo", "bar"],
            Labels: ["foo": "bar"],
            IsAdmin: true,
            Nullable: nil,
            CreatedAt: Date(timeIntervalSince1970: 150),
            Roles: [Role(name: "USER"), Role(name: "ADMIN")]
        )

        XCTAssertEqual(JSONBuilder(policy: .upperCamelCaseWithSpaces).serialize(object: u), "{\"Nullable\":null,\"Labels\":{\"Foo\":\"bar\"},\"Is Admin\":true,\"List\":[\"foo\",\"bar\"],\"First Name\":\"Axel\",\"Roles\":[{\"Name\":\"USER\"},{\"Name\":\"ADMIN\"}],\"Score\":4.5,\"Created At\":\"1970-01-01T00:02:30+0000\",\"Id\":1}")
    }

    func testBuilderWithNullObject() {
        XCTAssertNil(JSONBuilder().serialize(object: nil))
    }

    func testBuilderWithBadObject() {
        XCTAssertNil(JSONBuilder().serialize(object: 153))
    }

    func testBuilderWithNestedObject() {
        let author = Author(id: 851)
        let article = Article(id: 125, author: author)

        XCTAssertEqual(JSONBuilder().serialize(object: article), "{\"id\":125,\"author\":{\"id\":851}}")
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
