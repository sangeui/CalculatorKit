//
//  CKPowerOfTenTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKPowersOfTenTests: XCTestCase {
    func testCreatePowersOfTenFunction() {
        let functionType: CKFunctionType = .powersOfTen
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.powersOfTen, ckFunction.type)
    }
    func testCalculatePowersOfTenFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .powersOfTen)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(100, result)
    }
    static var allTests = [
        ("testCreatePowersOfTenFunction", testCreatePowersOfTenFunction),
        ("testCalculatePowersOfTenFunction", testCalculatePowersOfTenFunction)
    ]
}
