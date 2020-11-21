//
//  CKMinusOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKMinusOperatorTests: XCTestCase {
    func testCreateMinusOperator() {
        let minusType: CKOperatorType = .minus
        let ckOperator = CKOperator(type: minusType)
        
        XCTAssertEqual(.minus, ckOperator.type)
    }
    func testCalculateMinusOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (1, 2)
        let ckOperator = CKOperator(type: .minus)

        let result = ckOperator.calculate(firstNumber, secondNumber)

        XCTAssertEqual(firstNumber - secondNumber, result)
    }
    static var allTests = [
        ("testCreateMinusOperator", testCreateMinusOperator),
        ("testCalculateMinusOperator", testCalculateMinusOperator)
    ]
}
