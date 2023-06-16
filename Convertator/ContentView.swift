//
//  ContentView.swift
//  Convertator
//
//  Created by Jérémie - Ada on 16/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber = 0.0
    @State var inputUnit: String = "°C"
    @State var outputUnit: String = "°F"
    
    let unit = ["°C", "°F", "K"]
    
// model
    var Results : Double {
        var results : Double = 0
        // converti Celsius en Far
        if inputUnit == "°C" && outputUnit == "°F"{
            results = inputNumber * 9/5 + 32
            return results
        } // converti Celsius en Kelvin
        else if inputUnit == "°C" && outputUnit == "K" {
            results = inputNumber + 273.15
            return results
        } // Converti Far en Celsius
        else if  inputUnit == "°F" && outputUnit == "°C" {
            results = (inputNumber - 32) * (5/9)
            return results
        } // blabla
        else if inputUnit == "°F" && outputUnit == "K" {
            results = (inputNumber - 32) * (5/9) + 273.15
            return results
        } else if inputUnit == "K" && outputUnit == "°C" {
            results = inputNumber - 273.15
            return results
        } else if inputUnit == "K" && outputUnit == "°F" {
            results = (inputNumber - 273.15) * 9/5 + 32
            return results
        } else {
            results = inputNumber
            return results
        }
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Valeur", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Unité", selection: $inputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Inserez une valeur a convertir")
                }
                Section {
                    Text(Results.formatted())
                    Picker("Unité", selection: $outputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Résultat")
                }
            }
            .navigationTitle("Convertator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
