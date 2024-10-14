//
//  EditView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 10/6/24.
//

import SwiftUI

struct EditView: View {
    var mainColor = Color(.black)
    @State private var squat = ""
    @State private var bench = ""
    @State private var deadlift = ""
    @State private var navigate = false
    @Binding var navigationPath: NavigationPath
    @State var user: User?
    @EnvironmentObject var userModel: UserModel
    
    @State private var weightUnit = "lbs"
    
    var body: some View {
            ZStack {
                VStack {
                        if let tUser = user {
                        // Title
                            let finalName = user?.name ?? ""
                        VariableTextView(variableText: finalName)
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
                            TextField(String(tUser.squat), text: $squat)
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
                            TextField(String(tUser.bench), text: $bench)
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
                            TextField(String(tUser.deadlift), text: $deadlift)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .foregroundColor(.black)
                                .frame(width: 200)
                        }
                        .padding(.bottom, 40)
                        
                        Spacer()
                        
                        Button(action: {
                            let b = Int(bench) ?? -10000000
                            let s = Int(squat) ?? -10000000
                            let d = Int(deadlift) ?? -10000000
                            userModel.deleteUser(user: finalName)
                            if weightUnit == "lbs" {
                                userModel.addUser(username: finalName, user: User(name: finalName, bench: b, squat: s, deadlift: d))
                                                    } else {
                                                        userModel.addUser(username: finalName, user: User(name: finalName, bench: Int(Double(b) * 2.2), squat: Int(Double(s) * 2.2), deadlift: Int(Double(d) * 2.2)))
                                                    }
                            navigate = true
                        }) {
                            Text("Update")
                                .font(.headline)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: ResultsView2(user: userModel.users[finalName], navigationPath: $navigationPath), isActive: $navigate) {
                            EmptyView()
                        }
                        
                        Spacer()
                    }
                    else {
                        Text("Error, Please Try Again")
                            .font(.title)
                        Spacer()
                    }
                    
                }
                .padding()
                .background(Color.black.ignoresSafeArea())
            }
            .foregroundColor(.white)
            .onAppear {
                        if let tUser = user {
                            squat = String(tUser.squat)
                            bench = String(tUser.bench)
                            deadlift = String(tUser.deadlift)
                        }
                    }
        }
    }
        

#Preview {
    EditView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
