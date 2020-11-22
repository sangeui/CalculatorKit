//
//  CKLogFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKLogFunctionTests: XCTestCase {
    func testCreateLogFunction() {
        let functionType: CKFunctionType = .logBaseTen
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.logBaseTen, ckFunction.type)
    }
    func testCalculateLogFunction() {
        let number: Double = 10
        let ckFunction = CKFunction(type: .logBaseTen)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(1, result)
    }
    static var allTests = [
        ("testCreateLogFunction", testCreateLogFunction),
        ("testCalculateLogFunction", testCalculateLogFunction)
    ]
}
