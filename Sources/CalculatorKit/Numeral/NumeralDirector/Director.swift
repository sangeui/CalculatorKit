//
//  Manager.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/24.
//

import Foundation

extension Numeral {
    class Director {
        // 1. 초기 상태에는 0이 입력되어 있다.
        // 2. 0을 포함한 어떤 입력이 주어졌을 때, 기존의 0을 새 입력으로 대체된다.
        // 3. 최대 입력 가능 숫자 이상으로 입력이 주어졌을 때, 이를 무시한다.
        // 3-1. 에러를 발생시킨다.
        // 4. Decimal Mode 입력을 받았을 때 이를 처리한다.
        // 5. Sign 입력을 받았을 때 이를 처리한다.
        var storage = Storage()
        /// The maximum count up to which a digit can be kept
        var maxNumeralCount = 9
        
        func save(_ digitString: String) throws {
            guard validateDigitString(digitString) else {
                throw NumeralDirectorError.invalidDigit(digitString)
            }
            guard isSufficientForSaving else {
                throw NumeralDirectorError.reachedMaximumDigits(maxNumeralCount)
            }
            storage.save(digitString)
        }
        func make() throws -> Double {
            if let number = storage.load() { return number }
            else { throw NumeralDirectorError.failedToMakeNumber }
        }
    }
}
private extension Numeral.Director {
    var isSufficientForSaving: Bool {
        return storage.numeral.count({ $0 != "." }) < maxNumeralCount
    }
    func validateDigitString(_ digitString: String) -> Bool {
        return ((digitString.count == 1) && Double(digitString) != nil)
    }
}
extension Numeral.Director {
    enum NumeralDirectorError: Error {
        case invalidDigit(String)
        case reachedMaximumDigits(Int)
        case failedToMakeNumber
    }
}
