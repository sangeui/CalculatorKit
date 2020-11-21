//
//  SquareFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKSquareFunctionTests: XCTestCase {
    func testCreateSquareFunction() {
        let functionType: CKFunctionType = .square
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.square, ckFunction.type)
    }
    func testCalculateSquareFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .square)
        
        let result = ckFunction.calculate(number)
        
        XCTAssertEqual(4, result)
    }
    static var allTests = [
        ("testCreateSquareFunction", testCreateSquareFunction),
        ("testCalculateSquareFunction", testCalculateSquareFunction)
    ]
}
