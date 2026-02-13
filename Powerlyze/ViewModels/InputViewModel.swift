//
//  InputViewModel.swift
//  Powerlyze
//

import Foundation

/// ViewModel for the Analyze Strength input screen.
/// Manages form state and creates a User from the input values.
class InputViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var squat = ""
    @Published var bench = ""
    @Published var deadlift = ""
    @Published var weightUnit = "lbs"

    // MARK: - User Creation

    /// Creates a User from the current input values.
    /// Invalid (non-numeric) inputs default to a sentinel value that will fail validation.
    func createUser() -> User {
        let b = Int(bench) ?? AppConstants.invalidInputSentinel
        let s = Int(squat) ?? AppConstants.invalidInputSentinel
        let d = Int(deadlift) ?? AppConstants.invalidInputSentinel

        if weightUnit == "lbs" {
            return User(name: "", bench: b, squat: s, deadlift: d)
        } else {
            return User(
                name: "",
                bench: AppConstants.kgsToLbs(b),
                squat: AppConstants.kgsToLbs(s),
                deadlift: AppConstants.kgsToLbs(d)
            )
        }
    }
}
