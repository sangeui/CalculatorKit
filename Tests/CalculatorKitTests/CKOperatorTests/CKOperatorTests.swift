//
//  CKOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKOperatorTests: XCTestCase {
    func testCreateCKOperatorWithPlusType() {
        let ckOperatorType: CKOperatorType = .plus
        let ckOperator = CKOperator(type: .plus)
        
        XCTAssertEqual(ckOperatorType, ckOperator.type)
    }
    func testCalculatePlusOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (1, 2)
        let ckOperator = CKOperator(type: .plus)
        
        let sum = ckOperator.calculate(firstNumber, secondNumber)
        
        XCTAssertEqual(firstNumber + secondNumber, sum)
    }
    static var allTests = [
        ("testCreateCKOperatorWithPlusType", testCreateCKOperatorWithPlusType)
    ]
}
