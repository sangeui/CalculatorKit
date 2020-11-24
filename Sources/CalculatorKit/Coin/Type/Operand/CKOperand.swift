//
//  C.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation
protocol CKItem {}
struct CKOperand: Equatable, CKItem {
    var number: Double
}
