//
//  CalculatorButton.swift
//  calculator_app
//
//  Created by Abdelrahman Esmail on 02/07/2023.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText : String = "1"
    var color = Color (hue: 1.0, saturation: 0.0, brightness: 0.332)
    var width :CGFloat = 80
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .NotSet
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 80, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }

    }
}



struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
