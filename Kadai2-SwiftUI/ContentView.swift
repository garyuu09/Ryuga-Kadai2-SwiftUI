//
//  ContentView.swift
//  Kadai2-SwiftUI
//
//  Created by Ryuga on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    @State var number1: String = ""
    @State var number2: String = ""
    @State var calResult = "Label"
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            TextField("", text: $number1)
            TextField("", text: $number2)
            
            Picker("", selection: $selectedIndex){
                Text("+")
                    .tag(0)
                Text("-")
                    .tag(1)
                Text("×")
                    .tag(2)
                Text("÷")
                    .tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 200)
            .padding()
            
            Button("Button") {
                calResult = dispResult()
            }
            Text(String(calResult))
                .font(.title)
            Spacer()
        }
        .modifier(CustomTextFieldStyle())
        .padding()
        Spacer()
    }
    
    // In: ticker tagの値 Out: 計算結果の値
    private func dispResult() -> String {
        let num1 = Double(number1) ?? 0
        let num2 = Double(number2) ?? 0
        
        switch selectedIndex {
        case 0:
            return String(num1 + num2)
        case 1:
            return String(num1 - num2)
        case 2:
            return String(num1 * num2)
        case 3:
            if num2 == 0 {
                return "割る数には0以外を入力してください。"
            } else {
                return String(num1 / num2)
            }
        default:
            return ""
        }
    }
}

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(width: 200)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
