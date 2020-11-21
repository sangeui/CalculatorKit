//
//  ManagerTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class ManagerTests: XCTestCase {
    func test() {}
    func testEnterNumber() {
        let manager = CalculatorKit.Manager()
        let numberString = "1"
        manager.enter(.number(numberString))
        
        let coin = CKCoin(contents: .ckOperand(CKOperand(number: 1)))
        let lastCoin: CKCoin?
        
//        if let lastCoin = manager.lastCoin {
//            lastCoin = lastCoin
//        }
//        XCTAssertEqual(coin, manager.lastCoin)
    }
    func testEnterOperator() {
        
    }
    func testEnterFunction() {
        
    }
    static var allTests = [
        ("testEnterNumber", testEnterNumber),
        
    ]
}
