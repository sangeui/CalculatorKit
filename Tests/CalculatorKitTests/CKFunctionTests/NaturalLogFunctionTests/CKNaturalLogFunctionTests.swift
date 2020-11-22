//
//  CKNaturalLogFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKNaturalLogFunctionTests: XCTestCase {
    func testCreateNaturalLogFunction() {
        let functionType: CKFunctionType = .naturalLog
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.naturalLog, ckFunction.type)
    }
    func testCalculateNaturalLogFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .naturalLog)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(0.693, result.round(to: 3))
    }
    static var allTests = [
        ("testCreateNaturalLogFunction", testCreateNaturalLogFunction),
        ("testCalculateNaturalLogFunction", testCalculateNaturalLogFunction)
    ]
}
