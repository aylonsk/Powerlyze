//
//  Constants.swift
//  Powerlyze
//

import SwiftUI

/// Centralized app constants to avoid magic numbers and duplicated values.
enum AppConstants {

    // MARK: - Colors

    static let mainBackgroundColor = Color.black
    static let accentBlue = Color(red: 48/255, green: 105/255, blue: 240/255)

    // MARK: - UserDefaults Keys

    static let usersKey = "Users"
    static let userCountKey = "UserCount"
    static let firstLaunchKey = "firstLaunch"

    // MARK: - Sentinel Values

    /// Used as a fallback when user input can't be parsed to Int.
    /// Intentionally negative so it fails `User.isValid()`.
    static let invalidInputSentinel = -10_000_000

    // MARK: - Strength Level Thresholds (in lbs)

    static let beginnerMax = 675
    static let noviceMax = 945
    static let intermediateMax = 1215
    static let advancedMax = 1485
    static let eliteMax = 2000
    static let professionalMax = 2607

    // MARK: - Standard Lift Ratios (for specialty/weakness calculation)

    static let benchStandard: Double = 225
    static let squatStandard: Double = 315
    static let deadliftStandard: Double = 365

    // MARK: - Unit Conversion

    static func kgsToLbs(_ kgs: Int) -> Int {
        Int(Double(kgs) * 2.2)
    }

    // MARK: - URLs

    static let termsOfServiceURL = URL(string: "https://sites.google.com/view/powerlyzetos/home")!
    static let privacyPolicyURL = URL(string: "https://www.iubenda.com/privacy-policy/38832467")!
}
