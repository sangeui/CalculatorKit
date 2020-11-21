//
//  CKCoin.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

struct CKCoin {
    var contents: CKCoinContentsType
}
extension CKCoin {
    func extractContents() -> CKExpressionItem {
        switch contents {
        case .ckOperator(let extracted): return extracted as CKExpressionItem
        case .ckOperand(let extracted): return extracted as CKExpressionItem
        }
    }
}
enum CKCoinContentsType: Equatable {
    case ckOperand(CKOperand)
    case ckOperator(CKOperator)
}
