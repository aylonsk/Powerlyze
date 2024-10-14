//
//  PopupTextView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 10/4/24.
//

import SwiftUI

struct PopupTextView: View {
    var popupText: String
    @State private var showPopup = false
    
    var body: some View {
        ZStack {
            if showPopup {
                VStack {
                    Text(popupText)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .transition(.move(edge: .top))
                        .zIndex(1)
                    Spacer()
                }
                .padding(.top, 50)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            showPopup = false
                        }
                    }
                }
            }
        }
        .onAppear {
            withAnimation {
                showPopup = true
            }
        }
    }
}

#Preview {
    PopupTextView(popupText: "Text Should Go Here!")
}
