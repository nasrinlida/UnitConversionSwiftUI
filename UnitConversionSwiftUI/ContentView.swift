//
//  ContentView.swift
//  UnitConversionSwiftUI
//
//  Created by nasrinlida on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber = ""
    @State var inputUnit = 1
    @State var outputUnit = 1
    
    let unitList = ["Second", "Minute", "Hour", "Day"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input Number", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose the unit you want to convert from: ")) {
                    Picker("Unit of Input", selection: $inputUnit) {
                        ForEach(0 ..< unitList.count) {
                            Text("\(self.unitList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .textCase(nil)
                
                Section(header: Text("Choose the unit you want to convert into: ")) {
                    Picker("Unit of Output", selection: $outputUnit) {
                        ForEach(0 ..< unitList.count) {
                            Text("\(self.unitList[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .textCase(nil)
                
                Section {
                    Text("\(inputNumber)")
                }
            }
            .navigationBarTitle("UnitConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
