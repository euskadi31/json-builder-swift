import XCTest
@testable import JSONBuilder

struct User {
    var ID: Int?
    var FirstName: String?
}

class JSONBuilderTests: XCTestCase {
    func testDefaultBuilder() {
        let u = User(ID: 1, FirstName: "Axel")

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(JSONBuilder().serialize(object: u), "{\"ID\":1,\"FirstName\":\"Axel\"}")
    }


    static var allTests : [(String, (JSONBuilderTests) -> () throws -> Void)] {
        return [
            ("testDefaultBuilder", testDefaultBuilder),
        ]
    }
}
