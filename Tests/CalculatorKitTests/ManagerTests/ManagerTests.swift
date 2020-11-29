//
//  ManagerTests.swift
//  CalculatorKitTests
//
//  Created by 서상의 on 2020/11/21.
//

import XCTest
@testable import CalculatorKit

class ManagerTests: XCTestCase {
    var manager: CalculatorKit.Manager!
    override func setUp() {
        manager = CalculatorKit.Manager()
    }
    override func tearDown() {
        manager = nil
    }
    func testEnterNumber() {
        manager.enter(.number("3"))
        
        XCTAssertEqual(manager.numeralDirector.peek(), "3")
    }
    static var allTests = [("testEnterNumber", testEnterNumber)]
}
