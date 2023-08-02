//
//  Temperature.swift
//  Convertator
//
//  Created by Jérémie - Ada on 06/07/2023.
//

import SwiftUI

struct Temperature: View {
    
    @StateObject private var viewModel = ViewModel()
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "thermometer.sun.fill").padding(.leading).font(.title)
                
                Text("Température.titre").font(.title)
            }
        Form {
                Section {
                    TextField("Valeur", value: $viewModel.inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Unités", selection: $viewModel.inputUnit) {
                        ForEach(Temperature.ViewModel.unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Insérez")
                }
                Section {
                    Text(viewModel.ResultsTemp(inputNumber: viewModel.inputNumber,
                                               inputUnit: viewModel.inputUnit,
                                               outputUnit: viewModel.outputUnit).formatted())
                    Picker("Unité", selection: $viewModel.outputUnit) {
                        ForEach(Temperature.ViewModel.unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Résultat")
                }
                .navigationTitle("Convertator")
            }
        }
    }
    }

struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        Temperature()
    }
}
