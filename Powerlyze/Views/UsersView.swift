//
//  UsersView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI

struct UsersView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            AppConstants.mainBackgroundColor.ignoresSafeArea()
            VStack {
                Text("User List")
                    .font(.title)
                    .padding()

                if userViewModel.users.isEmpty {
                    Text("No saved users. \n Create users and they'll show up here!")
                        .padding(60)
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    List {
                        ForEach(userViewModel.users.keys.sorted(), id: \.self) { username in
                            NavigationLink(destination: EditView(navigationPath: $navigationPath, user: userViewModel.users[username])) {
                                Text(username)
                                    .padding()
                                    .foregroundColor(.white)
                                    .swipeActions(edge: .trailing) {
                                        Button(action: {
                                            userViewModel.deleteUser(username: username)
                                            dismiss()
                                        }, label: {
                                            Image(systemName: "trash")
                                        })
                                    }
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                    .background(Color.black)
                    .scrollContentBackground(.hidden)
                    .listStyle(PlainListStyle())
                    .onAppear {
                        UITableView.appearance().separatorColor = .white
                    }
                    .navigationTitle("Users")
                    .foregroundColor(.white)
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    UsersView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserViewModel())
}
