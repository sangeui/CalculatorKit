//
//  Store.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/24.
//

import Foundation

extension Numeral {
    class Storage {
        typealias Digits = [String]
        typealias Digit = String
        
        /// Array for keeping every entered `String` typed digit
        var numeral: Digits = []
        /// The maximum count up to which a digit can be kept
        var maxCount = 9
        /// The only number count in `numeral`
        var numCount: Int { return numeral.count({Double($0) != nil })}
        /// `Bool` value for indicating whether it is in the decimal mode
        var isDecimal = false
        /// `Bool` value for indicating whether the number has to be formed negative
        var isNegative = false
        /// Use this method for keeping any digit typed `String`
        /// It can be passed until the maximum count is reached
        /// - Parameter digitString: A digit typed `String` being passed for keeping
        /// - Throws
        func keep(_ digitString: Digit) throws {
            guard Double(digitString) != nil else {
                throw StoreError.invalidValue(digitString)
            }
            guard numeral.count < maxCount else {
                throw StoreError.recheadMaxLength(numeral.count)
            }
            numeral.append(digitString)
        }
        /// Use this method for setting the proper mode.
        /// - Supported modes
        ///   - Decimal: It allows decimal point to be appended at the end of the current number
        ///   - Positive or Negative: When it returns the number, this number is formed based on this mode.
        /// - Parameter mode
        func set(_ mode: Mode) {
            switch mode {
            case .decimal:
                if numCount < maxCount {
                    isDecimal = true
                    numeral.append(".")
                }
            case .negative:
                isNegative = true
            case .positive:
                isNegative = false
            }
        }
    }
}
extension Numeral.Storage {
    enum Mode {
        case decimal
        case negative
        case positive
    }
    enum StoreError: Error {
        case failedKeepingDigit(String)
        case invalidValue(String)
        case recheadMaxLength(Int)
    }
}
