//
//  ContentView.swift
//  UnitConversionSwiftUI
//
//  Created by nasrinlida on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber = ""
    @State var inputUnit = 0
    @State var outputUnit = 0
    
    let unitList = ["Second", "Minute", "Hour", "Day"]
    
    //Computed property inputAmount will return user's input
    //by converting into second taking second as the single base unit
    var inputAmount: Double {
        let amount = Double(inputNumber) ?? 0
        
        if unitList[inputUnit] == "Minute"{
            let minuteToSecond = amount * 60
            return minuteToSecond
            
        } else if unitList[inputUnit] == "Hour" {
            let hourToSecond = amount * 60 * 60
            return hourToSecond
            
        } else if unitList[inputUnit] == "Day" {
            let dayToSecond = amount * 24 * 60 * 60
            return dayToSecond
        }
        else {
            return amount
        }
    }
    
    //This computed propertry outputAmount will show the result in the converted unit.
    var outputAmount: Double {
        if unitList[outputUnit] == "Minute" {
            let secondToMinute = inputAmount / 60
            return secondToMinute
            
        } else if unitList[outputUnit] == "Hour" {
            let secondToHour = inputAmount / 60 / 60
            return secondToHour
            
        } else if unitList[outputUnit] == "Day" {
            let secondToDay = inputAmount / 24 / 60 / 60
            return secondToDay
            
        } else {
            return inputAmount
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter your desired amount: ")) {
                    TextField("Input Number", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                .textCase(nil)
                
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
                
                Section(header: Text("Output")) {
                    Text(String(format: "%.2f", outputAmount))
                }
                .textCase(nil)
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
