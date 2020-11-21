//
//  CKRootOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKRootOperatorTests: XCTestCase {
    func testCreateRootOperator() {
        let rootType: CKOperatorType = .root
        let ckOperator = CKOperator(type: rootType)
        
        XCTAssertEqual(.root, ckOperator.type)
    }
    func testCalculateRootOperator() {
        var firstNumber, secondNumber: Double
        (firstNumber, secondNumber) = (4, 2)
        let ckOperator = CKOperator(type: .root)
        
        let result = ckOperator.calculate(firstNumber, secondNumber)
        
        XCTAssertEqual(2, result)
    }
    static var allTests = [
        ("testCreateRootOperator", testCreateRootOperator),
        ("testCalculateRootOperator", testCalculateRootOperator)
    ]}
