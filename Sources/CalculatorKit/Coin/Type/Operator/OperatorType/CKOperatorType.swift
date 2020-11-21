//
//  CKOperatorType.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

enum CKOperatorType {
    case plus
    case minus
    case multiply
    case divide
    case exponent
    case root
}
extension CKOperatorType {
    func calculate(_ first: Double, _ second: Double) -> Double {
        switch self {
        case .plus: return first + second
        case .minus: return first - second
        case .multiply: return first * second
        case .divide: return first / second
        case .exponent: return pow(first, second)
        case .root: return pow(first, 1.0 / second)
        }
    }
}
