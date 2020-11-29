//
//  NumeralDirectorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/25.
//

import XCTest
@testable import CalculatorKit

class NumeralDirectorTests: XCTestCase {
    var director: Numeral.Director!
    
    override func setUp() { director = Numeral.Director() }
    override func tearDown() { director = nil }
    func test() {}
    
    // MARK: - When entered a digit typed `String`
    func testSaveDigit() {
        XCTAssertNoThrow(try director.save("3"))
        XCTAssertTrue(director.isEntered)
    }
    func testSaveDigitWhenEnteredMoreThanMax() {
        for _ in 1...9 { XCTAssertNoThrow(try director.save("1")) }
        XCTAssertThrowsError(try director.save("2"))
    }
    func testMakeNumber() {
        XCTAssertNoThrow(try director.save("3"))
        XCTAssertNoThrow(try director.save("5"))
        XCTAssertNoThrow(try director.save("8"))
        
        let result = try? director.make()
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 358)
    }
    func testMakeNUmberWhenIsEmpty() {
        XCTAssertEqual(try! director.make(), 0)
    }
    // MARK: - When received `Setting decimal`
    func testMakeNumberWhenIsSetToDecimal() {
        XCTAssertNoThrow(try director.save("3"))
        XCTAssertNoThrow(try director.save("5"))
        XCTAssertNoThrow(try director.save("8"))
        
        director.set(.decimal)
        XCTAssertNoThrow(try director.save("8"))
        
        let result = try? director.make()
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, 358.8)
    }
    // MARK: - When received `Setting some sign`
    func testMakeNumberWhenIsSetNegative() {
        XCTAssertNoThrow(try director.save("3"))
        XCTAssertNoThrow(try director.save("5"))
        XCTAssertNoThrow(try director.save("8"))
        
        director.set(.decimal)
        XCTAssertNoThrow(try director.save("8"))
        director.set(.signs(.negative))
        
        let result = try? director.make()
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result!, -358.8)
    }
    
    static var allTests = [ ("test", test) ]
}
