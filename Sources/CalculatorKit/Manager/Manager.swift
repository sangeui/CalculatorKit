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
        public init() {}
        public func enter(_ operator: One) {
        }
        public func enter(_ function: Two) {
            
        }
        public enum One {
            case one, two, three
        }
        public enum Two {
            case one, two, three
        }
    }
    
}
