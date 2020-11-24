import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CalculatorKitTests.allTests),
        testCase(ManagerTests.allTests),
        testCase(DigitStoreTests.allTests),
        
        testCase(CKCoinTests),
        
        testCase(CKOperandTests.allTests),
        testCase(CKOperatorTests.allTests),
        
        testCase(CKPlusOperatorTests.allTests),
        testCase(CKMinusOperatorTests.allTests),
        testCase(CKMultiplyOperatorTests.allTests),
        testCase(CKDivideOperatorTests.allTests),
        testCase(CKExponentOperatorTests.allTests),
        testCase(CKRootOperatorTests.allTests),
        
        testCase(CKSquareFunctionTests.allTests),
        testCase(CKCubeFunctionTests.allTests),
        testCase(CKSquareFunctionTests.allTests),
        testCase(CKReciprocalFunctionTests),
        testCase(CKSquareRootFunctionTests)
    ]
}
#endif
