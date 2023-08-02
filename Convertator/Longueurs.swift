//
//  Longueurs.swift
//  Convertator
//
//  Created by Jérémie - Ada on 23/06/2023.
//

import Foundation
import SwiftUI

struct Longueurs: View {
    
    @StateObject private var viewModel = ViewModel()
    @FocusState private var amountIsFocused: Bool

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "ruler").padding(.leading).font(.title)
                
                Text("Longueurs.titre").font(.title)
            }
        Form {
                Section {
                    TextField("Valeur", value: $viewModel.inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Unité", selection: $viewModel.inputUnit) {
                        ForEach(Longueurs.ViewModel.unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Insérez")
                }
                Section {
                    Text(viewModel.ResultsLong(inputNumber: viewModel.inputNumber,
                                               inputUnit: viewModel.inputUnit,
                                               outputUnit: viewModel.outputUnit)
                        .formatted())
                    Picker("Unité", selection: $viewModel.outputUnit) {
                        ForEach(Longueurs.ViewModel.unit, id: \.self) {
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

struct Longueurs_Previews: PreviewProvider {
    static var previews: some View {
        Longueurs()
    }
}
