//
//  Manager.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

extension CalculatorKit {
    public class Manager {
        var lastCoin: CKCoin?
        public func enter(_ key: Key) {
            if case let Key.number(numberString) = key,
               let number = Double(numberString) {
                let ckOperand = CKOperand(number: number)
                let ckCoin = CKCoin(contents: .ckOperand(ckOperand))
                lastCoin = ckCoin
            }
        }
    }
    enum Key {
        case number(String)
    }
}
