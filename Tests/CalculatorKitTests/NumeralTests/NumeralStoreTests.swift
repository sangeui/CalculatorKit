//
//  NumeralStoreTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/24.
//

import XCTest
@testable import CalculatorKit

class NumeralStoreTests: XCTestCase {
    var storage: Numeral.Storage!
    
    override func setUp() {
        storage = Numeral.Storage()
    }
    override func tearDown() {
        storage = nil
    }
    func givenDigits(_ digits: String...) {
        digits.forEach { storage.save($0) }
    }
    func givenOneToFiveDigits() {
        givenDigits("1", "2", "3", "4", "5")
    }
    func givenOneToFiveDigitsAndDecimal() {
        givenOneToFiveDigits()
        storage.decimal()
    }
    func testKeepDigit() {
        givenOneToFiveDigits()
        XCTAssertEqual("12345", storage.numeral.joined())
    }
    func testReturnNumber() {
        // given
        givenOneToFiveDigits()
        // then
        let result = storage.load()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 12345)
    }
    func testSetDecimal() {
        // given
        givenOneToFiveDigitsAndDecimal()
        // then
        let last = storage.numeral.last
        XCTAssertNotNil(last)
        XCTAssertEqual(last!, ".")
        XCTAssertTrue(storage.isDecimal)
    }
    func testUnsetDecimalWhenLastIsDecimal() {
        // given
        givenOneToFiveDigitsAndDecimal()
        // when
        storage.decimal()
        // then
        let last = storage.numeral.last
        XCTAssertNotNil(last)
        XCTAssertFalse(storage.isDecimal)
        XCTAssertFalse(last == ".")
    }
    func testIsPositiveWhenCreated() {
        XCTAssertFalse(storage.isNegative)
    }
    func testIsNegativeWhenSetToNegative() {
        storage.signs(.negative)
        XCTAssertTrue(storage.isNegative)
    }
    func testReturnsTheProperNumber() {
        "12383".forEach { storage.save("\($0)")}
        storage.decimal()
        storage.save("5")
        storage.decimal()
        storage.decimal()
        storage.isNegative = true
        
        let result = storage.load()
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result, -12383.5)
    }
}
