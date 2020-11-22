//
//  CKCubeRootFunctionTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/22.
//

import XCTest
@testable import CalculatorKit

class CKCubeRootFunctionTests: XCTestCase {
    func testCreateCubeRootFunction() {
        let functionType: CKFunctionType = .cubeRoot
        let ckFunction = CKFunction(type: functionType)
        
        XCTAssertEqual(.cubeRoot, ckFunction.type)
    }
    func testCalculateCubeRootFunction() {
        let number: Double = 9
        let ckFunction = CKFunction(type: .squareRoot)
        
        let result = ckFunction.calculate(number)
        XCTAssertEqual(3, result)
    }
    static var allTests = [
        ("testCreateCubeRootFunction", testCreateCubeRootFunction),
        ("testCalculateCubeRootFunction", testCalculateCubeRootFunction)
    ]
}
