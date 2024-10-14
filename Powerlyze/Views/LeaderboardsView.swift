//
//  LeaderboardsView.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/4/24.
//

import SwiftUI


struct LeaderboardsView: View {
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject var userModel: UserModel
    
    var mainColor = Color(.black)
    
    var body: some View {
        let leaderboards = userModel.sortedUsersByTotal()
        
        ZStack {
            mainColor.ignoresSafeArea()
            
            VStack {
                Text("Leaderboards")
                    .font(.title)
                    .padding()
                
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
        .foregroundColor(.white)
    }
}



#Preview {
    LeaderboardsView(navigationPath: .constant(NavigationPath()))
        .environmentObject(UserModel())
}
