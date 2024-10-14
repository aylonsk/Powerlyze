//
//  InputView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI

struct InputView: View {
    var mainColor = Color(.black)
    @EnvironmentObject var usermodel: UserModel
    @State private var squat = ""
    @State private var bench = ""
    @State private var deadlift = ""
    @State private var navigate = false
    @State private var user: User? = nil
    @Binding var navigationPath: NavigationPath
    
    @State private var weightUnit = "lbs"
    
    var body: some View {
            ZStack {
                VStack {
                            // Title
                            Text("Analyze Strength")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.bottom, 40)
                    
                    Picker(selection: $weightUnit, label: Text("")) {
                                    Text("lbs").tag("lbs")
                                    Text("kgs").tag("kgs")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(5)
                                .padding(.bottom, 40)
                    
                            // Squat Input
                            HStack {
                                Text("Squat:")
                                    .foregroundColor(.white)
                                TextField("Enter squat weight", text: $squat)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                                    .frame(width: 200)
                                    
                            }
                            .padding(.bottom, 20)
                            
                            // Bench Input
                            HStack {
                                Text("Bench:")
                                    .foregroundColor(.white)
                                TextField("Enter bench weight", text: $bench)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                                    .frame(width: 200)
                            }
                            .padding(.bottom, 20)
                            
                            // Deadlift Input
                            HStack {
                                Text("Deadlift:")
                                    .foregroundColor(.white)
                                TextField("Enter deadlift weight", text: $deadlift)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                                    .frame(width: 200)
                            }
                            .padding(.bottom, 40)
                            
                            Spacer()
                            
                            // Powerlyze Button
                            Button(action: {
                                let b = Int(bench) ?? -10000000
                                let s = Int(squat) ?? -10000000
                                let d = Int(deadlift) ?? -10000000
                                if (weightUnit == "lbs") {
                                    user = User(name: "", bench: b, squat: s, deadlift: d)
                                } else {
                                    user = User(name: "", bench: Int(Double(b) * 2.2), squat: Int(Double(s) * 2.2), deadlift: Int(Double(d) * 2.2))
                                }
                               
                                navigate = true
                            }) {
                                Text("Powerlyze!")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                    
                    NavigationLink(destination: ResultsView(user: user, navigationPath: $navigationPath)
                        .environmentObject(usermodel), isActive: $navigate) {
                        EmptyView()
                    }
                            
                            Spacer()
                        }
                .padding()
                .background(Color.black.ignoresSafeArea())
            }
            .foregroundColor(.white)
        }
    }

#Preview {
    InputView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
