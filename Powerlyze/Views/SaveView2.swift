//
//  SaveView2.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 10/9/24.
//

import SwiftUI

struct SaveView2: View {
    @Environment(\.dismiss) var dismiss
    var user: User?
    @State private var username = ""
    @State private var navigate = false
    @EnvironmentObject var usermodel: UserModel
    @Binding var navigationPath: NavigationPath
    @State private var popupMessage: String? = nil
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                if var tUser = user {
                    let specialty = tUser.specialty()
                    let weakness = tUser.weakness()
                    switch specialty {
                        case "Bench", "Squat", "Deadlift":
                            Text("Your strongest lift is...")
                            VariableTextView(variableText: specialty)
                        default:
                            Text("Error")
                                      }
                    switch weakness {
                        case "Bench", "Squat", "Deadlift":
                            Text("and your weakest lift is...")
                            VariableTextView(variableText: weakness)
                        default:
                            Text("Error")
                        }
                    
                    
                    Text("Need some inspiration? Here are some exercises for your strongest and weakest lifts!")
                        .padding()
                        .multilineTextAlignment(.center)
                    let a1 : [String] = tUser.recs(lift: specialty)
                    let a2 : [String] = tUser.recs(lift: weakness)
                    
                            ForEach(a1, id: \.self) { rec in
                                Text(rec)
                            }
                    
                            ForEach(a2, id: \.self) { rec in
                                Text(rec)
                            }
                    Text("\nWell, that's all from us. Good Luck!\n")
                    
                    
                    Button(action:{navigate = true} , label: {Text("Back to Menu")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.green)
                            .cornerRadius(10)})
                    
                    NavigationLink(destination: ContentView(), isActive: $navigate) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                } else {
                    Text("Error, Please Try Again")
                        .font(.title)
                    Spacer()
                }
            
                }
            }
        .foregroundColor(.white)
        }
    }

#Preview {
    SaveView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
