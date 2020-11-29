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
        /// `Bool` value for indicating whether it is in the decimal mode
        var isDecimal = false
        /// `Bool` value for indicating whether the number has to be formed negative
        var isNegative = false
        
        /// It receive a digit typed `String` which is stored in it.
        /// - Parameter digitString: A digit typed `String`
        func save(_ digitString: String) {
            numeral.append(digitString)
        }
        /// Returns Optional `Double`, it will return `nil` if the number is invalid.
        func load() -> Double? {
            defer { reset() }
            guard let numeral = Double(numeral.joined()) else { return nil }
            if isNegative { return numeral.negative }
            else { return numeral }
        }
        /// It sets the stored number to a decimal number.
        func decimal() {
            if !isDecimal { setDecimal() }
            else if numeral.last(isEqualTo: ".") != nil { unsetDecimal() }
        }
        func signs(_ sign: Signs) {
            switch sign {
            case .positive: isNegative = false
            case .negative: isNegative = true
            }
        }
    }
}
extension Numeral.Storage {
    enum Signs {
        case positive, negative
    }
}
private extension Numeral.Storage {
    func reset() {
        numeral.removeAll()
        isDecimal = false
        isNegative = false
    }
    func setDecimal() {
        isDecimal = true
        numeral.append(".")
    }
    func unsetDecimal() {
        isDecimal = false
        numeral.removeLast()
    }
}
