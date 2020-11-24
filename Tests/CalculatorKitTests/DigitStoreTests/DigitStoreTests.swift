//
//  DigitStoreTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/23.
//

import XCTest
@testable import CalculatorKit

class DigitStoreTests: XCTestCase {
    var store: DigitStore!
    override func setUp() {
        store = DigitStore()
    }
    override func tearDown() {
        store = nil
    }
    
    /// When given only digits each typed `String`: 1, 3, 4
    func givenEnteredOnlyDigits() {
        try? store.add(digit: "1")
        try? store.add(digit: "3")
        try? store.add(digit: "4")
    }
    /// When given deciaml point between digits each typed `String`: 1, 2, ., 2
    func givenEnteredDigitsWithDecimalPoint() {
        try? store.add(digit: "1")
        try? store.add(digit: "2")
        store.add(symbol: .decimalPoint)
        try? store.add(digit: "2")
    }
    func givenEnteredOnlyDigtsMoreThanMax(_ max: Int = 9, repeating: String = "1") {
        for _ in 1...(max + 1) { try? store.add(digit: repeating) }
    }
    func givenEnteredMaxDigitsAndDecimalPoint(_ max: Int = 9, repeating: String = "1") {
        givenEnteredOnlyDigtsMoreThanMax(max, repeating: repeating)
        store.add(symbol: .decimalPoint)
    }
    func testIfDigitIsStoredWhenEntered() {
        // Given
        givenEnteredOnlyDigits()
        let digits = store.digits
        
        // Then
        XCTAssertTrue(digits.isEmpty == false)
        XCTAssertEqual(digits.count, 3)
        XCTAssertEqual(digits.joined(), "134")
    }
    func testDigitNotAppendedIfLengthIsMax() {
        givenEnteredOnlyDigtsMoreThanMax()
        
        XCTAssertEqual(store.countFiltered, store.length)
    }
    func testIfDecimalPointAddedWhenEntered() {
        givenEnteredDigitsWithDecimalPoint()
        
        XCTAssertTrue(store.decimalMode)
        XCTAssertEqual(store.digits[2], ".")
        XCTAssertEqual(store.digits.joined(), "12.2")
    }
    func testIfPlusModeWhenStoreCreated() {
        XCTAssertTrue(store.signs == .plus)
    }
    func testIfMinusModeWhenSignsEnteredOnce() {
        store.add(symbol: .signs)
        
        XCTAssertEqual(store.signs, .minus)
    }
    func testIfPlusModeWhenSignsEnteredTwice() {
        store.add(symbol: .signs)
        store.add(symbol: .signs)
    
        XCTAssertEqual(store.signs, .plus)
    }
    func testIfDecimalPointIsNotCountedAsLength() {
//        let max = 9
//        let digit = "1"
//        givenEnteredMaxDigitsAndDecimalPoint(max, repeating: digit)
//
//        let expected = String(repeating: digit, count: max) + "."
//        print(store.digits)
//        XCTAssertEqual(store.digits.joined(), expected)
        try? store.add(digit: "0")
        store.add(symbol: .decimalPoint)
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "1")
        try? store.add(digit: "2")
        
        let expected = "0.11111112"
        
        XCTAssertEqual(store.digits.joined(), expected)
    }
    func testReturnDigitsAsDouble() {
//        givenEnteredOnlyDigits()
//        XCTAssertEqual(try? store.make(), 134)
//        XCTAssertTrue(store.digits.isEmpty)
//
//        givenEnteredDigitsWithDecimalPoint()
//        XCTAssertEqual(try? store.make(), 12.2)
//        XCTAssertTrue(store.digits.isEmpty)
//
//        givenEnteredMaxDigitsAndDecimalPoint(repeating: "1")
        try? store.add(digit: "0")
        store.add(symbol: .decimalPoint)
        
        XCTAssertEqual(try? store.make(), 0)
        XCTAssertTrue(store.digits.isEmpty)
    }
    func testReturnNegativeFormedWhenMinusMode() {
        givenEnteredOnlyDigits()
        store.add(symbol: .signs)
        
        XCTAssertEqual(try? store.make(), -134)
    }
    static var allTests = [
        ("testIfDigitIsStoredWhenEntered", testIfDigitIsStoredWhenEntered),
        ("testDigitNotAppendedIfLengthIsMax", testDigitNotAppendedIfLengthIsMax),
        ("testIfDecimalPointAddedWhenEntered", testIfDecimalPointAddedWhenEntered),
        ("testIfPlusModeWhenStoreCreated", testIfPlusModeWhenStoreCreated),
        ("testIfMinusModeWhenSignsEnteredOnce", testIfMinusModeWhenSignsEnteredOnce),
        ("testIfPlusModeWhenSignsEnteredTwice", testIfPlusModeWhenSignsEnteredTwice),
        ("testIfDecimalPointIsNotCountedAsLength", testIfDecimalPointIsNotCountedAsLength),
        ("testReturnDigitsAsDouble", testReturnDigitsAsDouble)
    ]
}
