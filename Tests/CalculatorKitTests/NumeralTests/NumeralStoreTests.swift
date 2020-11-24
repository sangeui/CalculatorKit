//
//  NumeralStoreTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/24.
//

import XCTest
@testable import CalculatorKit

class NumeralStoreTests: XCTestCase {
    var store: Numeral.Storage!
    var maxCount = 9
    
    override func setUp() {
        store = Numeral.Storage()
        store.maxCount = 9
    }
    override func tearDown() { store = nil }
    
    func givenMaxNumberOfDigits() {
        let digits = String(repeating: "1", count: maxCount)
        digits.forEach { try? store.keep("\($0)") }
    }
    func givenCertainNumberofDigits(_ count: Int) {
        let digits = String(repeating: "1", count: count)
        digits.forEach { try? store.keep("\($0)") }
    }
    
    // MARK: - When entered a value (digit) typed `String`
    func testStoreDigitWhenEntered() {
        let digitString = "1"
        try? store.keep(digitString)
        XCTAssertEqual(digitString, store.numeral.joined())
    }
    func testThrowErrorWhenInvalidValueEntered() {
        let invalidString = "d"
        XCTAssertThrowsError(try store.keep(invalidString))
    }
    func testThrowErrorWhenEnteredMoreThanMaxLength() {
        givenCertainNumberofDigits(maxCount+1)
        XCTAssertEqual(store.maxCount, store.numeral.count)
    }
    // MARK: -
    func testIsSetAsDecimal() {
        store.set(.decimal)
        XCTAssertTrue(store.isDecimal)
    }
    func testIsDecimalFormedNumberWhenReturns() {
        try? store.keep("1")
        try? store.keep("2")
        store.set(.decimal)
        try? store.keep("3")
        
        XCTAssertEqual(store.numeral.joined(), "12.3")
    }
    func testIgnoreDecimalPointAsCount() {
        try? store.keep("1")
        try? store.keep("2")
        store.set(.decimal)
        try? store.keep("3")
        
        XCTAssertEqual(store.numCount, 3)
    }
    func testSetAsDecimalModeWhenTheNumberIsMax() {
        // Cannot be set as the decimal mode when the maximum count of the number is reached.
        givenCertainNumberofDigits(maxCount)
        store.set(.decimal)
        
        XCTAssertFalse(store.isDecimal)
    }
    func testIsSetAsNegative() {
        store.set(.negative)
        XCTAssertTrue(store.isNegative)
    }
    func testIsSetAsPositive() {
        store.set(.positive)
        XCTAssertFalse(store.isNegative)
    }
    
    func test() {}
    static var allTests = [
        ("testIsSetAsDecimal", testIsSetAsDecimal),
        ("testIsSetAsNegative", testIsSetAsNegative)
    ]
}
