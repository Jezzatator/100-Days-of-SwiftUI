//
//  ContentView.swift
//  WeSplit
//
//  Created by Jérémie - Ada on 09/06/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages : Int = 0
    
    var  totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var  grandTotal: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    //bonus challenge
    
    var currencyType: FloatingPointFormatStyle<Double>.Currency{
        var result: FloatingPointFormatStyle<Double>.Currency
        
        result = .currency(code: Locale.current.currency?.identifier ?? "EUR")
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Somme", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Nombre de personnes", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) personnes")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Pourboire", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Pourboire?")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyType)
                } header: {
                Text("Total par personne")
            }
                
                Section {
                    Text(grandTotal, format: currencyType)
                } header: {
                Text("Total avec pourboire")
            }
                
            }
            .navigationTitle("WeSplit")
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
