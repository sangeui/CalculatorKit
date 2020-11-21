//
//  CKOperatorTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKOperandTests: XCTestCase {
    func testCKOperandTypeWithNumber() {
        let number: Double = 1
        let ckOperand = CKOperand(number: number)
        
        let ckOperandNumber = ckOperand.number
        XCTAssertEqual(number, ckOperandNumber)
    }

    static var allTests = [
        ("testCKOperandTypeWithNumber", testCKOperandTypeWithNumber),
    ]
}
