//
//  CKNaturalExponentialTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKNaturalExpTests: XCTestCase {
    func testCreateNaturalExpFunction() {
        let functionType: CKFunctionType = .naturalExp
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.naturalExp, ckFunction.type)
    }
    func testCalculateNaturalExpFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .naturalExp)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(7.38906, result.round(to: 5))
    }
    static var allTests = [
        ("testCreateNaturalExpFunction", testCreateNaturalExpFunction),
        ("testCalculateNaturalExpFunction", testCalculateNaturalExpFunction)
    ]
}

// https://stackoverflow.com/questions/34929932/round-up-double-to-2-decimal-places
extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
