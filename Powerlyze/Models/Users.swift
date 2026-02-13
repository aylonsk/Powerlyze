//
//  Users.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/18/24.
//

import Foundation

/// Model representing a powerlifter with their three competition lifts.
public struct User: Codable, Hashable {
    var name: String
    var bench: Int
    var squat: Int
    var deadlift: Int
    var total: Int

    init(name: String, bench: Int, squat: Int, deadlift: Int) {
        self.name = name
        self.bench = bench
        self.squat = squat
        self.deadlift = deadlift
        self.total = bench + squat + deadlift
    }

    // MARK: - Validation

    func isValid() -> Bool {
        bench >= 0 && squat >= 0 && deadlift >= 0
    }

    // MARK: - Mutations

    mutating func updateUser(name: String, bench: Int, squat: Int, deadlift: Int) {
        self.name = name
        self.bench = bench
        self.squat = squat
        self.deadlift = deadlift
        self.total = bench + squat + deadlift
    }

    // MARK: - Analysis

    func strengthLevel() -> String {
        if total < 0 {
            return "Error"
        } else if total <= AppConstants.beginnerMax {
            return "Beginner"
        } else if total <= AppConstants.noviceMax {
            return "Novice"
        } else if total <= AppConstants.intermediateMax {
            return "Intermediate"
        } else if total <= AppConstants.advancedMax {
            return "Advanced"
        } else if total <= AppConstants.eliteMax {
            return "Elite"
        } else if total <= AppConstants.professionalMax {
            return "Professional"
        } else if total > AppConstants.professionalMax {
            return "#1"
        } else {
            return "Error"
        }
    }

    func specialty() -> String {
        guard bench > 0, squat > 0, deadlift > 0 else { return "Error" }

        let r1 = Double(bench) / AppConstants.benchStandard
        let r2 = Double(squat) / AppConstants.squatStandard
        let r3 = Double(deadlift) / AppConstants.deadliftStandard

        if r1 >= r2 && r1 >= r3 {
            return "Bench"
        } else if r2 > r1 && r2 > r3 {
            return "Squat"
        } else if r3 > r1 && r3 > r2 {
            return "Deadlift"
        } else if r1 >= r2 || r1 >= r3 {
            return "Bench"
        } else if r2 > r1 || r2 > r3 {
            return "Squat"
        } else {
            return "Deadlift"
        }
    }

    func weakness() -> String {
        guard bench > 0, squat > 0, deadlift > 0 else { return "Error" }

        let r1 = Double(bench) / AppConstants.benchStandard
        let r2 = Double(squat) / AppConstants.squatStandard
        let r3 = Double(deadlift) / AppConstants.deadliftStandard

        if r1 < r2 && r1 < r3 {
            return "Bench"
        } else if r2 <= r1 && r2 <= r3 {
            return "Squat"
        } else if r3 <= r1 && r3 <= r2 {
            return "Deadlift"
        } else if r1 < r2 || r1 < r3 {
            return "Bench"
        } else if r2 <= r1 || r2 <= r3 {
            return "Squat"
        } else {
            return "Deadlift"
        }
    }

    func recs(lift: String) -> [String] {
        switch lift {
        case "Bench":
            return ["Tempo Bench", "Incline DB Press", "Lat Pulldowns"]
        case "Squat":
            return ["Pause Squat", "Leg Extensions", "Bulgarian Split Squats"]
        case "Deadlift":
            return ["Romanian Deadlifts", "Hip Thrusts", "Pause Deadlifts"]
        default:
            return ["Error"]
        }
    }
}
