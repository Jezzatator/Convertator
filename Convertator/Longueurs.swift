//
//  Longueurs.swift
//  Convertator
//
//  Created by Jérémie - Ada on 23/06/2023.
//

import SwiftUI

struct Longueurs: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit: String = "m"
    @State private var outputUnit: String = "dm"
    @FocusState private var amountIsFocused: Bool

    
    let unit = ["m", "dm", "cm", "km", "mm", "in", "ft","yd", "mi", "nmi"]
    
// model
     var ResultsVol : Double {
         var inputValue: Double = inputNumber
         var result: Double = 0
         
         // Convertir la valeur d'entrée en m
         switch inputUnit {
             case unit[1]: // dm
                inputValue /= 10
             case unit[2]: // cm
                inputValue /= 100
             case unit[3]: // km
                inputValue /= 0.001
             case unit[4]: // mm
                inputValue /= 1000
             case unit[5]: // in
                inputValue /= 39.37
             case unit[6]: // ft
                inputValue /= 3.28
             case unit[7]: // yd
                inputValue /= 35195.08
             case unit[8]: // mi
                inputValue /= 33814.02
             case unit[9]: // nmi
                inputValue /= 61023.74
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
                 result = inputValue * 39.37
             case unit[6]: // ft
                 result = inputValue * 3.28
             case unit[7]: // yd
                 result = inputValue * 35195.08
             case unit[8]: // mi
                 result = inputValue * 33814.02
             case unit[9]: // nmi
                 result = inputValue * 61023.74
             default:
                 result = inputValue
             }
             
             return result
         }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "ruler").padding(.leading).font(.title)
                
                Text("Longueurs").font(.title)
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
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Inserez une valeur a convertir")
                }
                Section {
                    Text(ResultsVol.formatted())
                    Picker("Unité", selection: $outputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Résultat")
                }
                .navigationTitle("Convertator")
            }
        }
    }
    }

struct Longueurs_Previews: PreviewProvider {
    static var previews: some View {
        Longueurs()
    }
}
