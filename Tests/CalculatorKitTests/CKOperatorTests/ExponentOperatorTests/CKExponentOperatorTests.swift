//
//  CKExponentOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKExponentOperatorTests: XCTestCase {
    func testCreateExponentOperator() {
        let exponentType: CKOperatorType = .exponent
        let ckOperator = CKOperator(type: exponentType)
        
        XCTAssertEqual(.exponent, ckOperator.type)
    }
    func testCalculateExponentOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (2, 3)
        let ckOperator = CKOperator(type: .exponent)

        let result = ckOperator.calculate(firstNumber, secondNumber)

        XCTAssertEqual(pow(firstNumber, secondNumber), result)
    }
    static var allTests = [
        ("testCreateExponentOperator", testCreateExponentOperator),
        ("testCalculateExponentOperator", testCalculateExponentOperator)
    ]

}
