//
//  CKFunction.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/22.
//

import Foundation

struct CKFunction {
    var type: CKFunctionType
    
    func calculate(_ number: Double) -> Double {
        return type.calculate(number)
    }
}
enum CKFunctionType {
    case square
    case cube
    case naturalExp
    case powersOfTen
}
extension CKFunctionType {
    func calculate(_ number: Double) -> Double {
        switch self {
        case .square:
            return CKOperator(type: .exponent).calculate(number, 2.0)
        case .cube:
            return CKOperator(type: .exponent).calculate(number, 3.0)
        case .naturalExp:
            return CKOperator(type: .exponent).calculate(M_E, number)
        case .powersOfTen:
            return CKOperator(type: .exponent).calculate(10, number)
        }
    }
}
