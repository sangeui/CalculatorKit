//
//  CKSquareRootFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKSquareRootFunctionTests: XCTestCase {
    func testCreateSquareRootFunction() {
        let functionType: CKFunctionType = .squareRoot
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.squareRoot, ckFunction.type)
    }
    func testCalculateSquareRootFunction() {
        let number: Double = 4
        let ckFunction = CKFunction(type: .squareRoot)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(2, result)
    }
    static var allTests = [
        ("testCreateSquareRootFunction", testCreateSquareRootFunction),
        ("testCalculateSquareRootFunction", testCalculateSquareRootFunction)
    ]
}
