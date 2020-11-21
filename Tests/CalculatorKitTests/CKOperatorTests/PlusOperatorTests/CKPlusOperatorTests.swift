//
//  CKPlusOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKPlusOperatorTests: XCTestCase {
    func testCreatePlusOperator() {
        let plusType: CKOperatorType = .plus
        let ckOperator = CKOperator(type: plusType)
        
        XCTAssertEqual(.plus, ckOperator.type)
    }
    func testCalculatePlusOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (1, 2)
        let ckOperator = CKOperator(type: .plus)
        
        let result = ckOperator.calculate(firstNumber, secondNumber)
        
        XCTAssertEqual(firstNumber + secondNumber, result)
    }
    static var allTests = [
        ("testCreatePlusOperator", testCreatePlusOperator),
        ("testCalculatePlusOperator", testCalculatePlusOperator)
    ]
}
