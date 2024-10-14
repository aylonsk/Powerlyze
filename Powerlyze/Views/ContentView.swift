//
//  ContentView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userModel = UserModel()
    var mainColor = Color(.black)
    @State private var navigationPath = NavigationPath()
    let prompts = ["Analyze Strength 💪", "Update Strength 📈", "Leaderboards 🏆", "FAQs"]
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                mainColor.ignoresSafeArea()
                VStack {
                    Image(systemName: "dumbbell.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Powerlyze")
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                    Image("photo2").resizable()
                        .aspectRatio(contentMode:.fit)
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
                                          .environmentObject(userModel)
                                  case "Update Strength 📈":
                                      UsersView(navigationPath: $navigationPath)
                                          .environmentObject(userModel)
                                  case "Leaderboards 🏆":
                                      LeaderboardsView(navigationPath: $navigationPath).environmentObject(userModel)
                                  case "FAQs":
                                      FAQsView(navigationPath: $navigationPath)
                                  default:
                                      EmptyView() // Handle unexpected cases
                                  }
                              }
                          }
                      }
                  }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserModel())
    }
}


