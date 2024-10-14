//
//  VariableTextView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/30/24.
//

import SwiftUI

struct VariableTextView: View {
    let variableText: String
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    var body: some View {
        Text(variableText)
            .font(.body)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .border(accentColor, width: 4)
    }
}

#Preview {
    VariableTextView(variableText: "Hello!")
}
