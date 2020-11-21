//
//  CKDivideOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKDivideOperatorTests: XCTestCase {
    func testCreateMultiplyOperator() {
        let divideType: CKOperatorType = .divide
        let ckOperator = CKOperator(type: divideType)
        
        XCTAssertEqual(.divide, ckOperator.type)
    }
    func testCalculateMultiplyOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (1.0, 2.0)
        let ckOperator = CKOperator(type: .divide)

        let result = ckOperator.calculate(firstNumber, secondNumber)

        XCTAssertEqual(firstNumber / secondNumber, result)
    }
    static var allTests = [
        ("testCreateMultiplyOperator", testCreateMultiplyOperator),
        ("testCalculateMultiplyOperator", testCalculateMultiplyOperator)
    ]
}
