//
//  EditView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 10/6/24.
//

import SwiftUI

struct EditView: View {
    @StateObject private var viewModel = EditViewModel()
    @State private var navigate = false
    @Binding var navigationPath: NavigationPath
    @State var user: User?
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            VStack {
                if let tUser = user {
                    let finalName = tUser.name

                    // Title
                    VariableTextView(variableText: finalName)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)

                    Picker(selection: $viewModel.weightUnit, label: Text("")) {
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
                        TextField(String(tUser.squat), text: $viewModel.squat)
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
                        TextField(String(tUser.bench), text: $viewModel.bench)
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
                        TextField(String(tUser.deadlift), text: $viewModel.deadlift)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                            .frame(width: 200)
                    }
                    .padding(.bottom, 40)

                    Spacer()

                    Button(action: {
                        viewModel.updateUser(name: finalName, in: userViewModel)
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

                    NavigationLink(
                        destination: ResultsView2(
                            user: userViewModel.users[finalName],
                            navigationPath: $navigationPath
                        ),
                        isActive: $navigate
                    ) {
                        EmptyView()
                    }

                    Spacer()
                } else {
                    Text("Error, Please Try Again")
                        .font(.title)
                    Spacer()
                }
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
            .onTapGesture {
                hideKeyboard()
            }
        }
        .foregroundColor(.white)
        .onAppear {
            if let tUser = user {
                viewModel.initialize(from: tUser)
            }
        }
    }
}

#Preview {
    EditView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserViewModel())
}
