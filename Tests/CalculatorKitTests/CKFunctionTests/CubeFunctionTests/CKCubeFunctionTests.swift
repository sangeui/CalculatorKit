//
//  CKCubeFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKCubeFunctionTests: XCTestCase {
    func testCreateCubeFunction() {
        let functionType: CKFunctionType = .cube
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.cube, ckFunction.type)
    }
    func testCalculateCubeFunction() {
        let number: Double = 2
        let ckFunction = CKFunction(type: .cube)
        
        let result = ckFunction.calculate(number)
        
        XCTAssertEqual(8, result)
    }
    static var allTests = [
        ("testCreateCubeFunction", testCreateCubeFunction),
        ("testCalculateCubeFunction", testCalculateCubeFunction)
    ]
}
