//
//  ContentView.swift
//  Convertator
//
//  Created by Jérémie - Ada on 16/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber = 0.0
    @State var inputUnit: String = ""
    @State var outputUnit: String = ""
    
    let unit = ["°C", "°F", "K"]
    
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
                    Text(inputNumber, format: .number)
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
