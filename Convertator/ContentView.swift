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
    @FocusState private var amountIsFocused: Bool

    
    let unit = ["°C", "°F", "K"]
    
// model
    var Results : Double {
        var results : Double = 0
        // converti Celsius en Far
        if inputUnit == unit[0] && outputUnit == unit[1]{
            results = inputNumber * 9/5 + 32
            return results
        } // converti Celsius en Kelvin
        else if inputUnit == unit[0] && outputUnit == unit[2] {
            results = inputNumber + 273.15
            return results
        } // Converti Far en Celsius
        else if  inputUnit == unit[1] && outputUnit == unit[0] {
            results = (inputNumber - 32) * (5/9)
            return results
        } // blabla
        else if inputUnit == unit[1] && outputUnit == unit[2] {
            results = (inputNumber - 32) * (5/9) + 273.15
            return results
        } else if inputUnit == unit[2] && outputUnit == unit[0] {
            results = inputNumber - 273.15
            return results
        } else if inputUnit == unit[2] && outputUnit == unit[1] {
            results = (inputNumber - 273.15) * 9/5 + 32
            return results
        } else {
            results = inputNumber
            return results
        }
    }
        
    var body: some View {
        NavigationView{
            TabView {
                tab1
                    .tabItem {
                        Label("Tab 1", systemImage: "circle")
                    }
                tab2
                    .tabItem {
                        Label("Tab 2", systemImage: "circle")
                    }
                tab3
                    .tabItem {
                        Label("Tab 3", systemImage: "circle")
                    }
            }
            .tabViewStyle(.page)
            .navigationTitle("Convertator")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Fini") {
                        amountIsFocused = false
                    }
                }
            }
            }
            }

   private var tab1: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "thermometer.sun.fill").padding(.leading).font(.title)
                
                Text("Température").font(.title)
            }
        Form {
                Section {
                    TextField("Valeur", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
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
        }
    }
    }

private var tab2: some View {
    ZStack {
        Text("Hello, World!")
             .padding()
    }
}
private var tab3: some View {
    ZStack {
       Text("Hello, World!")
            .padding()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
