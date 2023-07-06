//
//  ContentView.swift
//  calculator_app
//
//  Created by Abdelrahman Esmail on 02/07/2023.
//

import SwiftUI

enum CalculatorMode{
    case NotSet
    case Multiplication
    case Addition
    case Subtraction
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var currentMode :CalculatorMode = .NotSet
    @State var lastButtonWasMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                totalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didPressMode, mode: .Addition)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didPressMode, mode: .Subtraction)
                }
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "x", color: .orange, action: didPressMode, mode: .Multiplication)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 170, action: didPressNumber)
                    CalculatorButton(buttonText: "C", color: .gray, action: didPressClear)
                    CalculatorButton(buttonText: "=", color: .orange,action: didPressEquals)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton) {
        if lastButtonWasMode{
            lastButtonWasMode = false
            currentValueInt = 0
        }
        
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText){
            currentValueInt = parsedValue
            updateText()
        }
        else{
            currentValue = "Error"
            currentValueInt = 0
        }
        
        
    }
    
    func didPressMode(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func didPressEquals(button: CalculatorButton) {
        if lastButtonWasMode || currentMode == .NotSet{
            return
        }
        if currentMode == .Addition{
            savedNum += currentValueInt
        }
        else if currentMode == .Subtraction{
            savedNum -= currentValueInt
        }
        else if currentMode == .Multiplication{
            savedNum *= currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
    }
    func didPressClear(button: CalculatorButton) {
        currentValue = "0"
        currentMode = .NotSet
        lastButtonWasMode = false
        savedNum = 0
        currentValueInt = 0
    }
    func updateText(){
        if currentMode == .NotSet{
            savedNum = currentValueInt
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormatter.string(from: num) ?? "error"
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
