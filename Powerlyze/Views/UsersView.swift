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
    @EnvironmentObject var userModel: UserModel
    
    var mainColor = Color(.black)
    var secondColor = Color(.gray)
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("User List")
                    .font(.title)
                    .padding()
                
                List {
                    ForEach(userModel.users.keys.sorted(), id: \.self) { username in
                        NavigationLink(destination: EditView(navigationPath: $navigationPath, user: userModel.users[username])) {
                            Text(username)
                                .padding()
                                .foregroundColor(.white)
                                .swipeActions(edge:.trailing) {
                                    Button(action: {
                                        userModel.deleteUser(user: username)
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
            .foregroundColor(.white)
        }
        }
}

#Preview {
    UsersView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
