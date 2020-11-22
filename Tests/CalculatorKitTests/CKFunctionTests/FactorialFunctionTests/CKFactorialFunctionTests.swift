//
//  CKFactorialFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKFactorialFunctionTests: XCTestCase {
    func testCreateFactorialFunction() {
        let functionType: CKFunctionType = .factorial
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.factorial, ckFunction.type)
    }
    func testCalculateFactorialFunction() {
        let number: Double = 1.1
        let ckFunction = CKFunction(type: .factorial)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(-1, result)
    }
    static var allTests = [
        ("testCreateFactorialFunction", testCreateFactorialFunction),
        ("testCalculateFactorialFunction", testCalculateFactorialFunction)
    ]
}
