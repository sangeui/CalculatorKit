import XCTest
@testable import CalculatorKit

final class CalculatorKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CalculatorKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
