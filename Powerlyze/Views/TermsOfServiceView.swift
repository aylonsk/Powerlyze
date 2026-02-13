//
//  TermsOfServiceView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 10/16/24.
//

import SwiftUI

struct TermsOfServiceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Terms of Service")
                    .font(.largeTitle)
                    .bold()

                Text("Last updated: October 16, 2024")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Welcome to Powerlyze!")
                    .font(.title2)
                    .bold()

                Text("""
                These Terms of Service govern your use of our app Powerlyze. By using our app, you agree to be bound by these terms. Please read them carefully.
                
                1. **Use of the App**
                Powerlyze is provided for personal use. You are responsible for maintaining the security of your device and any account credentials you use with the app.
                
                2. **User Data**
                We respect your privacy and take steps to protect your data. By using Powerlyze, you agree to the terms outlined in our Privacy Policy.
                
                3. **Modifications**
                Powerlyze reserves the right to update or modify these terms at any time. Continued use of the app following any changes constitutes your acceptance of the updated terms.
                
                4. **Termination**
                We reserve the right to suspend or terminate your access to Powerlyze at our discretion, without notice, for conduct that violates these terms or any applicable law.
                
                5. **Limitation of Liability**
                Powerlyze is provided on an "as is" basis. We make no guarantees regarding the app’s functionality or accuracy. You agree that we are not liable for any damages or losses arising from your use of the app.
                """)
                
                Text("By continuing to use Powerlyze, you agree to these terms.")
                    .italic()
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Terms of Service")
    }
}

#Preview {
    TermsOfServiceView()
}
