//
//  FAQsView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI

struct FAQsView: View {
    @Binding var navigationPath: NavigationPath
    
    var mainColor = Color(.black)
    
    var body: some View {
            ZStack {
                mainColor.ignoresSafeArea()
                VStack {
                    Text("FAQs")
                        .font(.title)
                        .padding()
                        .bold()
                    VariableTextView(variableText: "What is Powerlyze?")
                    Text("Powerlyze is a fitness app made for Powerlifters, or anyone who's interested in finding out their strength level! By analyzing each of your lifts, we rank your strength on a global scale, determine your strengths and weaknesses, and give basic exercise recommendations.")
                        .multilineTextAlignment(.center)
                    
                    VariableTextView(variableText: "If I got a low ranking, does that mean I'm weak?")
                    Text("No! This app accomodates people at every single strength level, from beginners to professionals. Although there are always exceptions, if you don't train specifically for strength or powerlifting, you shouldn't expect to make it too far.")
                        .multilineTextAlignment(.center)
                    
                    VariableTextView(variableText: "How can I increase my strength?")
                    Text("Do your research! There are plenty of amazing guides, tutorials, influencers, and programs online. Good luck!")
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                }
            }
            .foregroundColor(.white)
    }
}

#Preview {
    FAQsView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
