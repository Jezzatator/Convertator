//
//  Volumes.swift
//  Convertator
//
//  Created by Jérémie - Ada on 23/06/2023.
//

import SwiftUI

struct Volumes: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit: String = "m³"
    @State private var outputUnit: String = "dm³"
    @FocusState private var amountIsFocused: Bool

    
    let unit = ["m³", "dm³", "cm³", "l", "dl", "cl", "ml","fl oz UK", "fl oz US", "inch³", "ft³", "yard³", "gal UK", "gal US"]
    
// model
     var ResultsVol : Double {
         var inputValue: Double = inputNumber
         var result: Double = 0
         
         switch inputUnit {
             case unit[1]: // dm³
                 inputValue /= 1000
             case unit[2]: // cm³
                 inputValue /= 1000000
             case unit[3]: // l
                 inputValue /= 1000
             case unit[4]: // dl
                 inputValue /= 10000
             case unit[5]: // cl
                 inputValue /= 100000
             case unit[6]: // ml
                 inputValue /= 1000000
             case unit[7]: // fl oz UK
                 inputValue /= 35195.08
             case unit[8]: // fl oz US
                 inputValue /= 33814.02
             case unit[9]: // inch³
                 inputValue /= 61023.74
             case unit[10]: // ft³
                 inputValue /= 35.31467
             case unit[11]: // yard³
                 inputValue /= 1.307951
             case unit[12]: // gal UK
                 inputValue /= 219.9692
             case unit[13]: // gal US
                 inputValue /= 264.1722
             default:
                 break
             }
             
             // Convertir la valeur en sortie demandée
             switch outputUnit {
             case unit[1]: // dm³
                 result = inputValue * 1000
             case unit[2]: // cm³
                 result = inputValue * 1000000
             case unit[3]: // l
                 result = inputValue * 1000
             case unit[4]: // dl
                 result = inputValue * 10000
             case unit[5]: // cl
                 result = inputValue * 100000
             case unit[6]: // ml
                 result = inputValue * 1000000
             case unit[7]: // fl oz UK
                 result = inputValue * 35195.08
             case unit[8]: // fl oz US
                 result = inputValue * 33814.02
             case unit[9]: // inch³
                 result = inputValue * 61023.74
             case unit[10]: // ft³
                 result = inputValue * 35.31467
             case unit[11]: // yard³
                 result = inputValue * 1.307951
             case unit[12]: // gal UK
                 result = inputValue * 219.9692
             case unit[13]: // gal US
                 result = inputValue * 264.1722
             default:
                 result = inputValue
             }
             
             return result
         }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "testtube.2").padding(.leading).font(.title)
                
                Text("Volumes").font(.title)
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

struct Volumes_Previews: PreviewProvider {
    static var previews: some View {
        Volumes()
    }
}
