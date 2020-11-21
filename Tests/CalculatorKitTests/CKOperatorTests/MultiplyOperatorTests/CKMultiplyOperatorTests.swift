//
//  CKMultiplyOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKMultiplyOperatorTests: XCTestCase {
    func testCreateMultiplyOperator() {
        let multiplyType: CKOperatorType = .multiply
        let ckOperator = CKOperator(type: multiplyType)
        
        XCTAssertEqual(.multiply, ckOperator.type)
    }
    func testCalculateMultiplyOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (1, 2)
        let ckOperator = CKOperator(type: .multiply)

        let result = ckOperator.calculate(firstNumber, secondNumber)

        XCTAssertEqual(firstNumber * secondNumber, result)
    }
    static var allTests = [
        ("testCreateMultiplyOperator", testCreateMultiplyOperator),
        ("testCalculateMultiplyOperator", testCalculateMultiplyOperator)
    ]

}
