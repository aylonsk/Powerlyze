//
//  Users.swift
//  Powerlyze
//
//  Created by Akira Baron Lonske on 9/18/24.
//

import Foundation
import SwiftUI


class UserModel: ObservableObject, Identifiable {
    var id = UUID()
    @Published var users: [String: User] = [:]
    
    @AppStorage("UserCount") var userCount: Int = 0

    init() {
        // Load users from UserDefaults when the model is initialized
        loadUsers()
    }

    func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "Users")
        }
    }

    func loadUsers() {
        if let data = UserDefaults.standard.data(forKey: "Users"),
           let decodedUsers = try? JSONDecoder().decode([String: User].self, from: data) {
            self.users = decodedUsers
        }
    }
    
    
    func deleteUser(user: String) {
        guard let deletedUserValue = users[user] else {
            return // User does not exist
        }
           users.removeValue(forKey: user)
           
           userCount = max(0, userCount - 1)
        
           saveUsers()
       }
    
func addUser(username: String, user: User) -> Bool {
    if (users[username] == nil) {
        users[username] = user
        userCount += 1
        saveUsers()
        return true
    } else {
        return false
    }
}
    
    func sortedUsersByTotal() -> [(String, User)] {
        // Sort the users by the total value in descending order
        let sortedUsers = users.sorted { $0.value.total > $1.value.total }
        
        // Return the sorted array of tuples (username, User)
        return sortedUsers
    }
        
}

public struct User: Codable, Hashable {
    var name: String
    var bench: Int
    var squat: Int
    var deadlift: Int
    var total: Int
    
    
    init (name: String, bench: Int, squat: Int, deadlift: Int) {
        self.name = name
        self.bench = bench
        self.squat = squat
        self.deadlift = deadlift
        self.total = bench + squat + deadlift
    }
    
    func isValid(bench: Int, squat: Int, deadlift: Int) -> Bool {
        return (bench >= 0 && squat >= 0 && deadlift >= 0);
    }
    
    
    
    mutating func updateUser(name: String, bench: Int, squat: Int, deadlift: Int) -> Void {
        self.name = name
        self.bench = bench
        self.squat = squat
        self.deadlift = deadlift
        self.total = bench + squat + deadlift
    }
    
    public func strengthLevel() -> String {
        if self.total < 0 {
            return "Error"
        }
        else if self.total <= 675 {
            return "Beginner"
        }
        else if self.total <= 945 {
            return "Novice"
        }
        else if self.total <= 1215 {
            return "Intermediate"
        }
        else if self.total <= 1485 {
            return "Advanced"
        }
        else if self.total <= 2000 {
            return "Elite"
        }
        else if self.total <= 2607 {
            return "Professional"
        }
        else if self.total > 2607 {
            return "#1"
        }
        else {
            return "Error"
        }
    }
    
    func specialty() -> String {
        if (self.bench <= 0 || self.squat <= 0 || self.deadlift <= 0) {
            return "Error"
        }
        let r1: Double = Double(self.bench) / 225
        let r2: Double = Double(self.squat) / 315
        let r3: Double = Double(self.deadlift) / 365
        if (r1 >= r2 && r1 >= r3) {
            return "Bench"
        } else if (r2 > r1 && r2 > r3) {
            return "Squat"
        } else if (r3 > r1 && r3 > r2) {
            return "Deadlift"
        } else if (r1 >= r2 || r1 >= r3) {
            return "Bench"
        } else if (r2 > r1 || r2 > r3) {
            return "Squat"
        } else {
            return "Deadlift"
    }
    }
    
    func weakness() -> String {
        if (self.bench <= 0 || self.squat <= 0 || self.deadlift <= 0) {
            return "Error"
        }
        let r1: Double = Double(self.bench) / 225
        let r2: Double = Double(self.squat) / 315
        let r3: Double = Double(self.deadlift) / 365
        if (r1 < r2 && r1 < r3) {
            return "Bench"
        } else if (r2 <= r1 && r2 <= r3) {
            return "Squat"
        } else if (r3 <= r1 && r3 <= r2) {
            return "Deadlift"
        } else if (r1 < r2 || r1 < r3) {
            return "Bench"
        } else if (r2 <= r1 || r2 <= r3) {
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
