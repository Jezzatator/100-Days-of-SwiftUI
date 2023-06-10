//
//  ContentView.swift
//  WeSplit
//
//  Created by Jérémie - Ada on 09/06/2023.
//

import SwiftUI

struct ContentView: View {
let name = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
        Form {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(name, id: \.self) {
                    Text($0)
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
