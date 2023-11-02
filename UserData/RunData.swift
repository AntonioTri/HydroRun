//
//  RunData.swift
//  HydroRun0.01
//
//  Created by Antonio on 01/11/23.
//

import Foundation

struct RunData: Codable {
    var date: Date // Date of the run
    var averageSpeed: Double // Average speed during the run (m/s)
    var distance: Double // Distance covered during the run (m)
    var timeElapsed: TimeInterval // Time elapsed during the run (s)

    // Method to save run data using UserDefaults
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "runData")
        }
    }

    // Static method to retrieve an instance with run data from UserDefaults
    static var shared: RunData? {
        let defaults = UserDefaults.standard
        if let savedRunData = defaults.object(forKey: "runData") as? Data {
            let decoder = JSONDecoder()
            if let decodedRunData = try? decoder.decode(RunData.self, from: savedRunData) {
                return decodedRunData
            }
        }
        return nil
    }
}
