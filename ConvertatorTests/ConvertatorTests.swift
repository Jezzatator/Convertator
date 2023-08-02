//
//  ConvertatorTests.swift
//  ConvertatorTests
//
//  Created by Jérémie - Ada on 31/07/2023.
//

import XCTest
@testable import Convertator

//["m", "dm", "cm", "km", "mm", "in", "ft","yd", "mi", "nmi"]

final class ConvertatorTests: XCTestCase {
    
    private var sut: Longueurs.ViewModel!
    
    @MainActor override func setUpWithError() throws {
        sut = Longueurs.ViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    @MainActor func test_convert10_return1093613() {
        let actual = sut.ResultsLong(inputNumber: 10, inputUnit: "m", outputUnit: "yd")
        let expected = 10.93613298338
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert34543455_return21464307817() {
        let actual = sut.ResultsLong(inputNumber: 34543455, inputUnit: "mm", outputUnit: "in")
        let expected = 1359978.5433070867
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convertNeg34543455_returnNeg21464307817() {
        let actual = sut.ResultsLong(inputNumber: -34543455, inputUnit: "mm", outputUnit: "in")
        let expected = -1359978.5433070867
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0_return0() {
        let actual = sut.ResultsLong(inputNumber: 0.0 , inputUnit: "mm", outputUnit: "in")
        let expected = 0.0
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convertM_returnM() {
        let actual = sut.ResultsLong(inputNumber: 55 , inputUnit: "m", outputUnit: "m")
        let expected = actual
        
        XCTAssertEqual(actual, expected)
    }
    
    func test_SampleTest() {
        let actual = true
        
        XCTAssertTrue(actual)
    }

}
