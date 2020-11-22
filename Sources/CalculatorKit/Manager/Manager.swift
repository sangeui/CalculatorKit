//
//  Manager.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

extension CalculatorKit {
    class Manager {
        var lastCoin: CKCoin?
        public init() {}
        public func enter(_ key: Key) {
            if case let Key.number(numberString) = key,
               let number = Double(numberString) {
                let ckOperand = CKOperand(number: number)
                let ckCoin = CKCoin(contents: .ckOperand(ckOperand))
                lastCoin = ckCoin
            }
        }
        public func enter(_ operator: CKOperatorType) {
        }
        public func enter(_ function: CKFunctionType) {
            
        }
    }
    enum Key {
        case number(String)
    }
}
