//
//  PowerlyzeApp.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 8/28/24.
//

import SwiftUI

@main
struct PowerlyzeApp: App {
    @EnvironmentObject var usermodel: UserModel
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserModel())
        }
    }
}
