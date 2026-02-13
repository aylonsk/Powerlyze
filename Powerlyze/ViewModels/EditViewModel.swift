//
//  EditViewModel.swift
//  Powerlyze
//

import Foundation

/// ViewModel for the Edit User screen.
/// Manages form state and applies updates to an existing user.
class EditViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var squat = ""
    @Published var bench = ""
    @Published var deadlift = ""
    @Published var weightUnit = "lbs"

    // MARK: - Initialization

    /// Populate form fields from an existing User.
    func initialize(from user: User) {
        squat = String(user.squat)
        bench = String(user.bench)
        deadlift = String(user.deadlift)
    }

    // MARK: - Update

    /// Deletes the old user entry and creates a new one with updated values.
    func updateUser(name: String, in userViewModel: UserViewModel) {
        let b = Int(bench) ?? AppConstants.invalidInputSentinel
        let s = Int(squat) ?? AppConstants.invalidInputSentinel
        let d = Int(deadlift) ?? AppConstants.invalidInputSentinel

        userViewModel.deleteUser(username: name)

        if weightUnit == "lbs" {
            userViewModel.addUser(
                username: name,
                user: User(name: name, bench: b, squat: s, deadlift: d)
            )
        } else {
            userViewModel.addUser(
                username: name,
                user: User(
                    name: name,
                    bench: AppConstants.kgsToLbs(b),
                    squat: AppConstants.kgsToLbs(s),
                    deadlift: AppConstants.kgsToLbs(d)
                )
            )
        }
    }
}
