//
//  Manager.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/21.
//

import Foundation

protocol CalculatorErrorDelegate {
    func calculatorFailedEnteringNumber(_ error: Error)
}
protocol CalculatorManagerDelegate {
    func calculatorChangedEnteredNumber(_ number: String)
}

extension CalculatorKit {
    public class Manager {
        var managerDelegate: CalculatorManagerDelegate?
        var errorDelegate: CalculatorErrorDelegate?
        var numeralDirector = Numeral.Director()
        
        var currentProcessingNumber = "" {
            didSet {
                managerDelegate?.calculatorChangedEnteredNumber(currentProcessingNumber)
            }
        }
    }
}
extension CalculatorKit.Manager {
    func enter(_ input: Input) {
        switch input {
        case .number(let number): enterNumber(number)
        }
    }
}
extension CalculatorKit.Manager {
    enum Input {
        case number(String)
    }
}
private extension CalculatorKit.Manager {
    func enterNumber(_ number: String) {
        do {
            try numeralDirector.save(number)
            
        }
        catch let error { errorDelegate?.calculatorFailedEnteringNumber(error) }
    }
}
