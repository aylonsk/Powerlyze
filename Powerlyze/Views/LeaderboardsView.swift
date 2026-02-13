//
//  LeaderboardsView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI

struct LeaderboardsView: View {
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        let leaderboards = userViewModel.sortedUsersByTotal()

        ZStack {
            AppConstants.mainBackgroundColor.ignoresSafeArea()

            VStack {
                Text("Leaderboards")
                    .font(.title)
                    .padding()
                if userViewModel.users.isEmpty {
                    Text("No saved users. \n Create users and they'll show up here!")
                        .padding(60)
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    List {
                        ForEach(Array(leaderboards.enumerated()), id: \.element.0) { index, element in
                            let (username, user) = element

                            HStack {
                                Text("#\(index + 1)").foregroundColor(.white)
                                Text(username).foregroundColor(.white)
                                Spacer()
                                Text("\(user.total) lbs").foregroundColor(.white)
                            }
                            .padding()
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
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    LeaderboardsView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserViewModel())
}
