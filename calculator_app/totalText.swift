//
//  totalText.swift
//  calculator_app
//
//  Created by Abdelrahman Esmail on 02/07/2023.
//

import SwiftUI

struct totalText: View {
    var value : String = "0"
    var body: some View {
        Text(value).foregroundColor(.white).font(.system(size: 50)).lineLimit(1)
    }
}

struct totalText_Previews: PreviewProvider {
    static var previews: some View {
        totalText().background(.black)
    }
}
