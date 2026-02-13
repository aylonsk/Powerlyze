//
//  ContentView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var navigationPath = NavigationPath()
    @AppStorage(AppConstants.firstLaunchKey) private var firstLaunch: Bool = true

    private let prompts = ["Analyze Strength 💪", "Update Strength 📈", "Leaderboards 🏆", "FAQs"]

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                AppConstants.mainBackgroundColor.ignoresSafeArea()
                VStack {
                    Image(systemName: "dumbbell.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Powerlyze")
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                    Image("photo2").resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    ForEach(prompts, id: \.self) { prompt in
                        NavigationLink(value: prompt) {
                            Text(prompt).font(.title2)
                                .padding()
                        }
                        .buttonStyle(.bordered)
                    }

                    Spacer()
                }
                .foregroundColor(.white)
            }
            .navigationDestination(for: String.self) { prompt in
                switch prompt {
                case "Analyze Strength 💪":
                    InputView(navigationPath: $navigationPath)
                        .environmentObject(userViewModel)
                case "Update Strength 📈":
                    UsersView(navigationPath: $navigationPath)
                        .environmentObject(userViewModel)
                case "Leaderboards 🏆":
                    LeaderboardsView(navigationPath: $navigationPath)
                        .environmentObject(userViewModel)
                case "FAQs":
                    FAQsView(navigationPath: $navigationPath)
                default:
                    EmptyView()
                }
            }
            if firstLaunch {
                PopupTextView2(popupText: makeAttributedText())
                    .onAppear {
                        firstLaunch = false
                    }
            }
        }
    }

    // MARK: - Helpers

    private func makeAttributedText() -> AttributedString {
        var attributedString = AttributedString("By continuing, you agree to our Terms of Service and Privacy Policy.")

        if let termsRange = attributedString.range(of: "Terms of Service") {
            attributedString[termsRange].link = AppConstants.termsOfServiceURL
            attributedString[termsRange].foregroundColor = .blue
            attributedString[termsRange].underlineStyle = .single
        }

        if let privacyRange = attributedString.range(of: "Privacy Policy") {
            attributedString[privacyRange].link = AppConstants.privacyPolicyURL
            attributedString[privacyRange].foregroundColor = .blue
            attributedString[privacyRange].underlineStyle = .single
        }

        return attributedString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}
