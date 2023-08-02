//
//  testUnit.swift
//  Convertator
//
//  Created by Jérémie - Ada on 31/07/2023.
//

import Foundation

//Test Long

class testLongueurs {
    func ResultsLong(inputNumber: Double, inputUnit: String, outputUnit: String) -> Double {
        
        var inputUnit: String = inputUnit
        var outputUnit: String = outputUnit
        
        let unit = ["m", "dm", "cm", "km", "mm", "in", "ft","yd", "mi", "nmi"]
        var inputValue: Double = inputNumber
        var result: Double = 0
        
        // Convertir la valeur d'entrée en m
        switch inputUnit {
            case unit[1]:// dm
               inputValue /= 10
            case unit[2]: // cm
               inputValue /= 100
            case unit[3]: // km
               inputValue /= 0.001
            case unit[4]: // mm
               inputValue /= 1000
            case unit[5]: // in
                inputValue /= 39.3700787402
            case unit[6]: // ft
                inputValue /= 3.28083989501
            case unit[7]: // yd
                inputValue /= 1.09361329834
            case unit[8]: // mi
                inputValue /= 0.00062137
            case unit[9]: // nmi
                inputValue /= 0.000539956803
            default:
                break
            }
            
            // Convertir la valeur en sortie demandée
        switch outputUnit {
            case unit[1]: // dm
                result = inputValue * 10
            case unit[2]: // cm
                result = inputValue * 100
            case unit[3]: // km
                result = inputValue * 0.001
            case unit[4]: // mm
                result = inputValue * 1000
            case unit[5]: // in
                result = inputValue * 39.3700787402
            case unit[6]: // ft
                result = inputValue * 3.28083989501
            case unit[7]: // yd
                result = inputValue * 1.093613298338
            case unit[8]: // mi
                result = inputValue * 0.00062137
            case unit[9]: // nmi
                result = inputValue * 0.000539956803
            default:
                result = inputValue
            }
            
            return result
        }
    
}
