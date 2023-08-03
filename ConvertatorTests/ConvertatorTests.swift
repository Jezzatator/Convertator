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
    private var sutVol: Volumes.ViewModel!
    
    @MainActor override func setUpWithError() throws {
        sutLong = Longueurs.ViewModel()
        sutTem = Temperature.ViewModel()
        sutVol = Volumes.ViewModel()
    }
    
    override func tearDownWithError() throws {
        sutLong = nil
        sutTem = nil
        sutVol = nil
    }
    
    // UNIT TEST LONGUEUR
    
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
    
    // UNIT TEST TEMPERATURE
    
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
    
    @MainActor func test_convert32C_return89FTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 32.0 , inputUnit: "°C", outputUnit: "°F")
        let expected = 89.6
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert89F_return32FTEMP() {
        let actual = sutTem.ResultsTemp(inputNumber: 89.6 , inputUnit: "°F", outputUnit: "°C")
        let expected = 32.0
        
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
    
    // UNIT TEST VOLUME
    //["m³", "dm³", "cm³", "l", "dl", "cl", "ml","fl oz UK", "fl oz US", "inch³", "ft³", "yard³", "gal UK", "gal US"]

    @MainActor func test_convert1m_return1307yardVOL() {
        let actual = sutVol.ResultsVol(inputNumber: 1.0 , inputUnit: "m³", outputUnit: "yard³")
        let expected = 1.307950613786
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert43m_return1583ozUKVOL() {
        let actual = sutVol.ResultsVol(inputNumber: 43.0 , inputUnit: "m³", outputUnit: "fl oz UK")
        let expected = 1513388.4282977218
        
        XCTAssertEqual(actual, expected)
    }
    
    @MainActor func test_convert1000000000000l_return610237440947323inchVOL() {
        let actual = sutVol.ResultsVol(inputNumber: 1000000000000.0, inputUnit: "l", outputUnit: "inch³")
        let expected = 61023744094732.296875
        
        XCTAssertEqual(actual, expected)

    }
    
    func test_SampleTest() {
        let actual = true
        
        XCTAssertTrue(actual)
    }

}
