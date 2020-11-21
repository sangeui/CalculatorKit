//
//  CKOperator.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

struct CKOperator {
    var type: CKOperatorType
    
    func calculate(_ first: Double, _ second: Double) -> Double {
        return type.calculate(first, second)
    }
}
