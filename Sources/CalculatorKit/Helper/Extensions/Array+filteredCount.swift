//
//  Double+filteredCount.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/23.
//

extension Array where Element == String {
    func count(_ isIncluded: (String) -> Bool) -> Int {
        return self.filter(isIncluded).count
    }
}
