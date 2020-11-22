//
//  CKFunction.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/22.
//

import Foundation

/// it calculates the number depending on function type.
struct CKFunction {
    /// Any function type can be used with the number.
    var type: CKFunctionType
    
    /// This method calculates `number` parameter based on its type.
    /// and return the result of `Double` type
    /// - Parameter number: The number for calculating.
    /// - Returns: the result of calculating.
    func calculate(_ number: Double) -> Double {
        return type.calculate(number)
    }
}


enum CKFunctionType {
    /// Square of current entry
    /// ```
    /// .square.calculate(2) // 4
    /// ```
    case square
    /// Cube of current entry
    /// ```
    /// .cube.calculate(2) // 8
    /// ```
    case cube
    /// Natural number to the power of current entered number
    /// ```
    /// .naturalExp.calculate(2) // 7.389...
    /// ```
    case naturalExp
    /// 10 rased to the power of current entered number
    /// ```
    /// .powersOfTen.calculate(2) // 100
    /// ```
    case powersOfTen
    /// 1 divided by current entered number
    /// ```
    /// .reciprocal.calculate(2) // 0.5
    /// ```
    case reciprocal
    /// Square root
    /// ```
    /// .squareRoot.calculate(4) // 2
    /// ```
    case squareRoot
    /// Cube root
    /// ```
    /// .cubeRoot.calculate(9) // 2
    /// ```
    case cubeRoot
    /// Natural logarithm of current entered number
    /// ```
    /// .naturalLog.calculate(2) // 0.693...
    /// ```
    case naturalLog
    /// Base 10 logarithm of current entered number
    /// ```
    /// .logBaseTen.calculate(10) // 1
    /// ```
    case logBaseTen
    /// the product of a given positive integer multiplied by all lesser positive integers
    /// ```
    /// // Possible case
    /// .factorial.calculate(3) // 6
    /// // It won't be work
    /// .factorial.calculate(-1) // ERROR
    /// .factorial.calculate(1.1) // ERROR
    /// ```
    /// - warning
    /// It will return any negative number if the number entered into `calculate` method is not unsigned integer shape.
    case factorial
}
extension CKFunctionType {
    /// it determines how the number sent from the outside be calculated and returns the result of calculating.
    /// - Parameter number: The number for calculating
    /// - Returns: The result of calculating typed `Double`
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
        case .reciprocal:
            return CKOperator(type: .divide).calculate(1, number)
        case .squareRoot:
            return CKOperator(type: .root).calculate(number, 2.0)
        case .cubeRoot:
            return CKOperator(type: .root).calculate(number, 3.0)
        case .naturalLog: return log(number)
        case .logBaseTen: return log10(number)
        case .factorial: return number.factorial()
        }
    }
}
extension Double {
    func factorial() -> Self {
        guard self > 0 else { return -1}
        guard self.truncatingRemainder(dividingBy: 1) == 0 else { return -1 }
        guard self != 0 else { return 1 }
        
        var fact: Double = 1
        
        for n in stride(from: 1, to: self+1, by: 1) {
            fact = fact * n
        }
        return Double(fact)
    }
}
