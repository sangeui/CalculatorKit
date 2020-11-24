//
//  CKCoin.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation


/// Encapsulation of `CKContents`.
struct CKCoin {
    var contents: Contents
}
extension CKCoin {
    func extractContents() -> CKItem {
        switch contents {
        case .operator(let extracted): return extracted as CKItem
        case .operand(let extracted): return extracted as CKItem
        case .function(let extracted): return extracted as CKItem
        }
    }
}
extension CKCoin {
    enum Contents: Equatable {
        case `operator`(CKOperator)
        case operand(CKOperand)
        case function(CKFunction)
    }
}
