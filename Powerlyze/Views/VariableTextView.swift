//
//  VariableTextView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/30/24.
//

import SwiftUI

struct VariableTextView: View {
    let variableText: String

    var body: some View {
        Text(variableText)
            .font(.body)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .border(AppConstants.accentBlue, width: 4)
    }
}

#Preview {
    VariableTextView(variableText: "Hello!")
}
