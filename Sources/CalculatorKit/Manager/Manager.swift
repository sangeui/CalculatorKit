//
//  Manager.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

extension CalculatorKit {
    public class Manager {
        var digitStore = DigitStore()
        var digitEntered = false
        
        public init() {}
        
        func enter(digit: String) {
            do {
                if !digitEntered {
                    digitStore.digits.removeAll()
                }
                
                try digitStore.add(digit: digit)
            }
            catch _ {
                // TODO: Handling Error
            }
        }
        private func getEnteredNumber() -> Double? {
            guard digitEntered == true else {
                return 0.0
            }
            var number: Double? = nil
            do {
                number = try digitStore.make()
            } catch let error as DigitStore.DigitStoreError {
                switch error {
                case .failedMakingNumber(let string):
                    print("failed making number: \(string)")
                default: break
                }
            } catch {}
            
            return number
        }
    }
}
