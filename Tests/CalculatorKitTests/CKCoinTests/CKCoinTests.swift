//
//  CKCoinTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class CKCoinTests: XCTestCase {
    func testCreateOperandCoin() {
        let number = 1.0
        let ckOperand = CKOperand(number: number)
        let coinType = CKCoinContentsType.ckOperand(ckOperand)
        let coin = CKCoin(contents: coinType)
        
        XCTAssertEqual(coinType, coin.contents)
    }
    func testCreateOperatorCoin() {
        let ckOperator = CKOperator(type: .plus)
        let coinType = CKCoinContentsType.ckOperator(ckOperator)
        let coin = CKCoin(contents: coinType)
        
        XCTAssertEqual(coinType, coin.contents)
    }
    func testIfCoinContentsIsOperand() {
        let number: Double = 1
        let ckOperand = CKOperand(number: number)
        let coinContents = CKCoinContentsType.ckOperand(ckOperand)
        let coin = CKCoin(contents: coinContents)

        XCTAssertTrue(coin.extractContents() is CKOperand)
    }
    func testIfCoinContentsIsOperator() {
        let ckOperator = CKOperator(type: .plus)
        let coinContents = CKCoinContentsType.ckOperator(ckOperator)
        let coin = CKCoin(contents: coinContents)
        
        XCTAssertTrue(coin.extractContents() is CKOperator)
    }
    
    static var allTests = [
        ("testCreateOperandCoin", testCreateOperandCoin),
        ("testCreateOperatorCoin", testCreateOperatorCoin),
        ("testIfCoinContentsIsOperand", testIfCoinContentsIsOperand),
        ("testIfCoinContentsIsOperator", testIfCoinContentsIsOperator)
    ]
}
