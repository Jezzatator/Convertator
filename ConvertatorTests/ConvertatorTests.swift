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
    
    private var sutLong: Longueurs.ViewModel!
    private var sutTem: Temperature.ViewModel!
    
    @MainActor override func setUpWithError() throws {
        sutLong = Longueurs.ViewModel()
        sutTem = Temperature.ViewModel()
    }
    
    override func tearDownWithError() throws {
        sutLong = nil
        sutTem = nil
    }
    
    @MainActor func test_convert10_return1093613LONG() {
        let actual = sutLong.ResultsLong(inputNumber: 10, inputUnit: "m", outputUnit: "yd")
        let expected = 10.93613298338
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert34543455_return21464307817LONG() {
        let actual = sutLong.ResultsLong(inputNumber: 34543455, inputUnit: "mm", outputUnit: "in")
        let expected = 1359978.5433070867
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convertNeg34543455_returnNeg21464307817LONG() {
        let actual = sutLong.ResultsLong(inputNumber: -34543455, inputUnit: "mm", outputUnit: "in")
        let expected = -1359978.5433070867
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0_return0LONG() {
        let actual = sutLong.ResultsLong(inputNumber: 0.0 , inputUnit: "mm", outputUnit: "in")
        let expected = 0.0
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convertM_returnMLONG() {
        let actual = sutLong.ResultsLong(inputNumber: 55 , inputUnit: "m", outputUnit: "m")
        let expected = actual
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0C_return32FTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 0.0 , inputUnit: "°C", outputUnit: "°F")
        let expected = 32.0
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0F_returnNeg17777CTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 0.0 , inputUnit: "°F", outputUnit: "°C")
        let expected = -17.77777777777778
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert100C_return212FTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 100.0 , inputUnit: "°C", outputUnit: "°F")
        let expected = 212.0
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0K_returnNeg459FTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 0.0 , inputUnit: "K", outputUnit: "°F")
        let expected = -459.66999999999996
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert0K_returnNeg273CTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 0.0 , inputUnit: "K", outputUnit: "°C")
        let expected = -273.15
        
        XCTAssertEqual(actual, expected)
    }
    
    func test_SampleTest() {
        let actual = true
        
        XCTAssertTrue(actual)
    }

}
