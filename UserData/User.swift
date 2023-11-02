//
//  User.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//

import Foundation

struct User: Codable {
    var isInitialLaunch: Bool // Indicates whether it's the user's initial launch
    var nickname: String // User's nickname
    var age: Int // User's age
    var height: Double // User's height in centimeters
    var weight: Double // User's weight in kilograms
    var fitnessLevel: Int // User's fitness level (1-10)
    var runData: RunData? // Data related to the user's run

    // Private initializer to create an instance of User
    private init(isInitialLaunch: Bool, nickname: String, age: Int, height: Double, weight: Double, fitnessLevel: Int, runData: RunData? = nil) {
        self.isInitialLaunch = isInitialLaunch
        self.nickname = nickname
        self.age = age
        self.height = height
        self.weight = weight
        self.fitnessLevel = fitnessLevel
        self.runData = runData
    }

    // Method to save user data using UserDefaults
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "userData")
        }

        // Add handling for saving run data
        if let runData = runData {
            runData.save()
        }
    }

    // Method to start a run and record the data
    mutating func startRun(averageSpeed: Double, distance: Double, timeElapsed: TimeInterval) {
        let runData = RunData(date: Date(), averageSpeed: averageSpeed, distance: distance, timeElapsed: timeElapsed)
        self.runData = runData
    }

    // Method to complete a run and save the data
    mutating func completeRun() {
        self.save() // Save user and run data
    }

    // Computed property to access historical run data
    var historicalRunData: [RunData] {
        if let savedRunData = UserDefaults.standard.object(forKey: "historicalRunData") as? Data {
            let decoder = JSONDecoder()
            if let decodedRunData = try? decoder.decode([RunData].self, from: savedRunData) {
                return decodedRunData
            }
        }
        return []
    }
}

extension User {
    static var shared: User {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: "userData") as? Data {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(User.self, from: savedUser) {
                return decodedUser
            }
        }
        return User(
            isInitialLaunch: defaults.bool(forKey: "isInitialLaunch"),
            nickname: defaults.string(forKey: "nickname") ?? "",
            age: defaults.integer(forKey: "age"),
            height: defaults.double(forKey: "height"),
            weight: defaults.double(forKey: "weight"),
            fitnessLevel: defaults.integer(forKey: "fitnessLevel"),
            runData: RunData.shared
        )
    }
}
