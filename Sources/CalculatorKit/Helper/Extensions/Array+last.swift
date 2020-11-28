//
//  Array+last.swift
//  CalculatorKit
//
//  Created by 서상의 on 2020/11/26.
//

import Foundation

extension Array where Element: Equatable {
    /// Returns the last element if it equals to the parameter `element`
    /// - Parameter element: the element which you want to get
    /// - Returns: It returns nil if the last element doesn't equal to the element you want even if the last element exists
    func last(isEqualTo element: Element) -> Element? {
        guard let last = self.last else { return nil }
        if last == element { return last }
        else { return nil }
    }
}
