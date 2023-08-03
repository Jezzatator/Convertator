//
//  Volumes.swift
//  Convertator
//
//  Created by Jérémie - Ada on 23/06/2023.
//

import SwiftUI

struct Volumes: View {
    
    @StateObject private var viewModel = ViewModel()
    @FocusState private var amountIsFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "testtube.2").padding(.leading).font(.title)
                
                Text("Volumes.titre").font(.title)
            }
        Form {
                Section {
                    TextField("Valeur", value: $viewModel.inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Unité", selection: $viewModel.inputUnit) {
                        ForEach(Volumes.ViewModel.unit, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Insérez")
                }
                Section {
                    Text(viewModel.ResultsVol(inputNumber: viewModel.inputNumber,
                                              inputUnit: viewModel.inputUnit,
                                              outputUnit: viewModel.outputUnit).formatted())
                    Picker("Unité", selection: $viewModel.outputUnit) {
                        ForEach(Volumes.ViewModel.unit, id: \.self) {
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
