//
//  CKReciprocalFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKReciprocalFunctionTests: XCTestCase {
    func testCreateReciprocalFunction() {
        let functionType: CKFunctionType = .reciprocal
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.reciprocal, ckFunction.type)
    }
    func testCalculateReciprocalFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .reciprocal)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(0.5, result)
    }
    static var allTests = [
        ("testCreateReciprocalFunction", testCreateReciprocalFunction),
        ("testCalculateReciprocalFunction", testCalculateReciprocalFunction)
    ]
}
