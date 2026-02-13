//
//  UserViewModel.swift
//  Powerlyze
//

import Foundation
import SwiftUI

/// ViewModel responsible for managing User data and persistence.
/// Views observe this object for user-related state changes.
class UserViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var users: [String: User] = [:]
    @AppStorage(AppConstants.userCountKey) var userCount: Int = 0

    // MARK: - Initialization

    init() {
        loadUsers()
    }

    // MARK: - Persistence

    func saveUsers() {
            if let encoded = try? JSONEncoder().encode(users) {
                UserDefaults.standard.set(encoded, forKey: AppConstants.usersKey)
            }
        }

    func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: AppConstants.usersKey),
            let decoded = try? JSONDecoder().decode([String: User].self, from: data) {
            self.users = decoded
        }
    }


    // MARK: - CRUD Operations

    /// Add a new user. Returns `true` if successful, `false` if the username already exists.
    @discardableResult
    func addUser(username: String, user: User) -> Bool {
        guard users[username] == nil else { return false }
        users[username] = user
        userCount += 1
        saveUsers()
        return true
    }

    /// Delete a user by username.
    func deleteUser(username: String) {
        guard users[username] != nil else { return }
        users.removeValue(forKey: username)
        userCount = max(0, userCount - 1)
        saveUsers()
    }

    // MARK: - Queries

    /// Returns users sorted by total in descending order.
    func sortedUsersByTotal() -> [(String, User)] {
        users.sorted { $0.value.total > $1.value.total }
    }
}
