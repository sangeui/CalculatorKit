//
//  CKCoinTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKCoinTests: XCTestCase {
    // Tests creating a coin
    func testCreateOperandCoin() {
        let number = 1.0
        let ckOperand = CKOperand(number: number)
        let coinType = CKCoin.Contents.operand(ckOperand)
        let coin = CKCoin(contents: coinType)
        
        XCTAssertEqual(coinType, coin.contents)
    }
    func testCreateOperatorCoin() {
        let ckOperator = CKOperator(type: .plus)
        let coinType = CKCoin.Contents.operator(ckOperator)
        let coin = CKCoin(contents: coinType)
        
        XCTAssertEqual(coinType, coin.contents)
    }
    func testCreateFunctionCoin() {
        let ckFunction = CKFunction(type: .cube)
        let coinType = CKCoin.Contents.function(ckFunction)
        let coin = CKCoin(contents: coinType)
        
        let function = coin.extractContents() as? CKFunction
        
        XCTAssertNotNil(function)
        XCTAssertEqual(function?.type, .cube)
    }
    // Tests
    func testIfCoinContentsIsOperand() {
        let number: Double = 1
        let ckOperand = CKOperand(number: number)
        let coinContents = CKCoin.Contents.operand(ckOperand)
        let coin = CKCoin(contents: coinContents)

        XCTAssertTrue(coin.extractContents() is CKOperand)
    }
    func testIfCoinContentsIsOperator() {
        let ckOperator = CKOperator(type: .plus)
        let coinContents = CKCoin.Contents.operator(ckOperator)
        let coin = CKCoin(contents: coinContents)
        
        XCTAssertTrue(coin.extractContents() is CKOperator)
    }
    func testIfCoinContentsIsFunction() {
        let ckFunction = CKFunction(type: .cube)
        let coinContents = CKCoin.Contents.function(ckFunction)
        let coin = CKCoin(contents: coinContents)
        
        XCTAssertTrue(coin.extractContents() is CKFunction)
    }
    
    static var allTests = [
        ("testCreateOperandCoin", testCreateOperandCoin),
        ("testCreateOperatorCoin", testCreateOperatorCoin),
        ("testCreateFunctionCoin", testCreateFunctionCoin),
        ("testIfCoinContentsIsOperand", testIfCoinContentsIsOperand),
        ("testIfCoinContentsIsOperator", testIfCoinContentsIsOperator),
        ("testIfCoinContentsIsFunction", testIfCoinContentsIsFunction)
    ]
}
