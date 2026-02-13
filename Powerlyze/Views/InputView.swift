//
//  InputView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI

struct InputView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject private var viewModel = InputViewModel()
    @State private var navigate = false
    @State private var user: User? = nil
    @Binding var navigationPath: NavigationPath

    var body: some View {
        ZStack {
            VStack {
                // Title
                Text("Analyze Strength")
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
                    TextField("Enter squat weight", text: $viewModel.squat)
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
                    TextField("Enter bench weight", text: $viewModel.bench)
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
                    TextField("Enter deadlift weight", text: $viewModel.deadlift)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .foregroundColor(.black)
                        .frame(width: 200)
                }
                .padding(.bottom, 40)

                Spacer()

                // Powerlyze Button
                Button(action: {
                    user = viewModel.createUser()
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

                NavigationLink(
                    destination: ResultsView(user: user, navigationPath: $navigationPath)
                        .environmentObject(userViewModel),
                    isActive: $navigate
                ) {
                    EmptyView()
                }

                Spacer()
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
            .onTapGesture {
                hideKeyboard()
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    InputView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserViewModel())
}
