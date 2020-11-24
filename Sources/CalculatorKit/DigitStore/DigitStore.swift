//
//  DigitStore.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/23.
//

import Foundation

/// It stores a digit typed `String` and has rules, maximum digits length, for example.
/// And also it handles signs and decimal point.
class DigitStore {
    /// Array for storing every entered digit typed `String`
    var digits: [String] = []
    /// Maximum digits length, the default is `9`
    var length = 9
    /// Count of digits filtered so that it has only digit `String`.
    var countFiltered: Int {
        // TODO: It would be good if use other logic.
        // example: check current state.
        return digits.count({Double($0) != nil})
    }
    /// It indicates whether the current state is decimal mode or not
    var decimalMode = false
    /// It determines signs of the digits
    var signs: Signs = .plus
    
    /// It adds `digit` typed `String` and throws possible error type based on the current state of the store.
    /// - Parameter digit: A digit typed `String` to be stored
    /// - Throws: `DigitStoreError` error type conforming to `Error`
    func add(digit: String) throws {
        guard countFiltered < length else {
            throw DigitStoreError.reachedMaximumLength(length)
        }
        guard Double(digit) != nil else {
            throw DigitStoreError.enteredInvalidDigit(digit)
        }
        digits.append(digit)
    }
    
    /// It sets the proper state based on the parameter `symbol` typed `Symbol`
    /// - Parameter symbol: `Symbol` type
    func add(symbol: Symbol) {
        switch symbol {
        case .signs:
            if signs == .plus { signs = .minus }
            else { signs = .plus }
        case .decimalPoint:
            decimalMode = true
            digits.append(".")
        }
    }
    
    /// It returns the number typed in `Double` using stored digits
    ///  and if it can't be converted to number, throws error, `DigitStoreError.failedMakingNumber(String)`
    /// - Throws: `DigitStoreError.failedMakingNumber(String)`
    /// - Returns: Digits typed `Double`
    func make() throws -> Double {
        defer { digits.removeAll() }
        guard let number = Double(digits.joined()) else {
            throw DigitStoreError.failedMakingNumber(digits.joined())
        }
        if signs == .minus { return number.negative }
        else { return number }
    }
}
extension DigitStore {
    enum Signs {
        case plus, minus
    }
}
extension DigitStore {
    enum Symbol {
        case signs
        case decimalPoint
    }
}
extension DigitStore {
    enum DigitStoreError: Error {
        case reachedMaximumLength(Int)
        case enteredInvalidDigit(String)
        case failedMakingNumber(String)
    }
}
