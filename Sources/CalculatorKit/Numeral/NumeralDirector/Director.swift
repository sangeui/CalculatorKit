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
        var maxInput = 9
        /// It indicates whether any input is entered or not.
        var isEntered = false
        
        init() { storage.save("0") }
        
        func save(_ input: String) throws {
            guard validateInput(input) else { throw SaveError.invalidInput(input) }
            guard sufficientSpace else { throw SaveError.maxInput(maxInput) }
            if isEntered == false { storage.load() }
            storage.save(input)
            isEntered.on()
        }
        func make() throws -> Double {
            defer { isEntered.off() }
            if let number = storage.load() { return number }
            else { throw MakeError.invalidResult }
        }
        func set(_ mode: Mode) {
            switch mode {
            case .decimal: storage.decimal()
            case .signs(let sign): storage.signs(sign) }
        }
        func peek() -> String {
            return storage.numeral.joined()
        }
    }
}
// MARK: - Related to `save` method
private extension Numeral.Director {
    var sufficientSpace: Bool {
        return storage.numeral.count({ $0 != "." }) < maxInput
    }
    func validateInput(_ digitString: String) -> Bool {
        return ((digitString.count == 1) && Double(digitString) != nil)
    }
}
extension Numeral.Director {
    enum Mode {
        case decimal
        case signs(Numeral.Storage.Signs)
    }
}
extension Numeral.Director {
    enum SaveError: Error {
        case invalidInput(String)
        case maxInput(Int)
    }
    enum MakeError: Error {
        case invalidResult
    }
}

extension Bool {
    mutating func on() { self = true }
    mutating func off() { self = false }
}
