//
//  C.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation
protocol CKExpressionItem {}
struct CKOperand: Equatable, CKExpressionItem {
    var number: Double
}
