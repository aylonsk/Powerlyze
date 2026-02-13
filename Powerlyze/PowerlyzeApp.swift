//
//  PowerlyzeApp.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 8/28/24.
//

import SwiftUI

@main
struct PowerlyzeApp: App {
    @StateObject private var userViewModel = UserViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}
