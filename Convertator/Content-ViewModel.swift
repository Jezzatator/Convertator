//
//  Content-ViewModel.swift
//  Convertator
//
//  Created by Jérémie - Ada on 06/07/2023.
//

import Foundation

extension Longueurs {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var inputNumber = 0.0
        @Published var inputUnit: String = "m"
        @Published var outputUnit: String = "dm"
        
        public static let unit = ["m", "dm", "cm", "km", "mm", "in", "ft","yd", "mi", "nmi"]
        
        func ResultsLong() -> Double {
            var inputValue: Double = inputNumber
            var result: Double = 0
            
            // Convertir la valeur d'entrée en m
            switch inputUnit {
                case Longueurs.ViewModel.unit[1]: // dm
                   inputValue /= 10
                case Longueurs.ViewModel.unit[2]: // cm
                   inputValue /= 100
                case Longueurs.ViewModel.unit[3]: // km
                   inputValue /= 0.001
                case Longueurs.ViewModel.unit[4]: // mm
                   inputValue /= 1000
                case Longueurs.ViewModel.unit[5]: // in
                    inputValue /= 39.3700787402
                case Longueurs.ViewModel.unit[6]: // ft
                    inputValue /= 3.28083989501
                case Longueurs.ViewModel.unit[7]: // yd
                    inputValue /= 1.09361329834
                case Longueurs.ViewModel.unit[8]: // mi
                    inputValue /= 0.00062137
                case Longueurs.ViewModel.unit[9]: // nmi
                    inputValue /= 0.000539956803
                default:
                    break
                }
                
                // Convertir la valeur en sortie demandée
            switch outputUnit {
                case Longueurs.ViewModel.unit[1]: // dm
                    result = inputValue * 10
                case Longueurs.ViewModel.unit[2]: // cm
                    result = inputValue * 100
                case Longueurs.ViewModel.unit[3]: // km
                    result = inputValue * 0.001
                case Longueurs.ViewModel.unit[4]: // mm
                    result = inputValue * 1000
                case Longueurs.ViewModel.unit[5]: // in
                    result = inputValue * 39.3700787402
                case Longueurs.ViewModel.unit[6]: // ft
                    result = inputValue * 3.28083989501
                case Longueurs.ViewModel.unit[7]: // yd
                    result = inputValue * 1.09361329834
                case Longueurs.ViewModel.unit[8]: // mi
                    result = inputValue * 0.00062137
                case Longueurs.ViewModel.unit[9]: // nmi
                    result = inputValue * 0.000539956803
                default:
                    result = inputValue
                }
                
                return result
            }
        
    }
}


extension Temperature {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var inputNumber = 0.0
        @Published var inputUnit: String = "°C"
        @Published var outputUnit: String = "°F"
        
        public static let unit = ["°C", "°F", "K"]
        
        func ResultsTemp() -> Double {
            var inputValue: Double = inputNumber
            var result : Double = 0
            
            // Convertir la valeur d'entrée en °C
            switch inputUnit {
                case Temperature.ViewModel.unit[1]: //°F
                    inputValue = (inputValue - 32) * (5/9)
                case Temperature.ViewModel.unit[2]: //K
                    inputValue -= 273.15
                default:
                    break
            }
            
            // Convertir la valeur en sortie demandée
            switch outputUnit {
                case Temperature.ViewModel.unit[1]: //°F
                    result = inputValue * 9/5 + 32
                case Temperature.ViewModel.unit[2]: //K
                    result = inputValue + 273.15
                default:
                    result = inputValue
            }
            return result
        }
    }
}

extension Volumes {
    @MainActor class ViewModel: ObservableObject {
        @Published var inputNumber = 0.0
        @Published var inputUnit: String = "m³"
        @Published var outputUnit: String = "dm³"
        
        public static let unit = ["m³", "dm³", "cm³", "l", "dl", "cl", "ml","fl oz UK", "fl oz US", "inch³", "ft³", "yard³", "gal UK", "gal US"]
        
        func ResultsVol() -> Double {
            var inputValue: Double = inputNumber
            var result: Double = 0
            
            // Convertir la valeur d'entrée en m3
            switch inputUnit {
            case Volumes.ViewModel.unit[1]: // dm³
                    inputValue /= 1000
            case Volumes.ViewModel.unit[2]: // cm³
                    inputValue /= 1000000
            case Volumes.ViewModel.unit[3]: // l
                    inputValue /= 1000
            case Volumes.ViewModel.unit[4]: // dl
                    inputValue /= 10000
            case Volumes.ViewModel.unit[5]: // cl
                    inputValue /= 100000
            case Volumes.ViewModel.unit[6]: // ml
                    inputValue /= 1000000
            case Volumes.ViewModel.unit[7]: // fl oz UK
                    inputValue /= 35195.08
            case Volumes.ViewModel.unit[8]: // fl oz US
                    inputValue /= 33814.02
            case Volumes.ViewModel.unit[9]: // inch³
                    inputValue /= 61023.74
            case Volumes.ViewModel.unit[10]: // ft³
                    inputValue /= 35.31467
            case Volumes.ViewModel.unit[11]: // yard³
                    inputValue /= 1.307951
            case Volumes.ViewModel.unit[12]: // gal UK
                    inputValue /= 219.9692
            case Volumes.ViewModel.unit[13]: // gal US
                    inputValue /= 264.1722
                default:
                    break
                }
                
                // Convertir la valeur en sortie demandée
                switch outputUnit {
                case Volumes.ViewModel.unit[1]: // dm³
                    result = inputValue * 1000
                case Volumes.ViewModel.unit[2]: // cm³
                    result = inputValue * 1000000
                case Volumes.ViewModel.unit[3]: // l
                    result = inputValue * 1000
                case Volumes.ViewModel.unit[4]: // dl
                    result = inputValue * 10000
                case Volumes.ViewModel.unit[5]: // cl
                    result = inputValue * 100000
                case Volumes.ViewModel.unit[6]: // ml
                    result = inputValue * 1000000
                case Volumes.ViewModel.unit[7]: // fl oz UK
                    result = inputValue * 35195.08
                case Volumes.ViewModel.unit[8]: // fl oz US
                    result = inputValue * 33814.02
                case Volumes.ViewModel.unit[9]: // inch³
                    result = inputValue * 61023.74
                case Volumes.ViewModel.unit[10]: // ft³
                    result = inputValue * 35.31467
                case Volumes.ViewModel.unit[11]: // yard³
                    result = inputValue * 1.307951
                case Volumes.ViewModel.unit[12]: // gal UK
                    result = inputValue * 219.9692
                case Volumes.ViewModel.unit[13]: // gal US
                    result = inputValue * 264.1722
                default:
                    result = inputValue
                }
                
                return result
            }
        
    }
}
