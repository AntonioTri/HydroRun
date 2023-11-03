//
//  RunData.swift
//  HydroRun0.01
//
//  Created by Antonio on 01/11/23.
//

import Foundation

struct RunData {
    var date: Date // Giorno in cui hai corso
    var averageSpeed: Double // Velocità media
    var distance: Double // Chilometraggio
    var timeElapsed: TimeInterval // Tempo impiegato

    // Inizializzatore per creare un'istanza di RunData
    init(date: Date, averageSpeed: Double, distance: Double, timeElapsed: TimeInterval) {
        self.date = date
        self.averageSpeed = averageSpeed
        self.distance = distance
        self.timeElapsed = timeElapsed
    }

    // Metodo per salvare i dati della corsa con UserDefaults
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(date, forKey: "runDate")
        defaults.set(averageSpeed, forKey: "averageSpeed")
        defaults.set(distance, forKey: "distance")
        defaults.set(timeElapsed, forKey: "timeElapsed")
    }
}

// Metodo statico per ottenere l'istanza con i dati della corsa
extension RunData {
    static var shared: RunData {
        let defaults = UserDefaults.standard
        return RunData(
            date: defaults.object(forKey: "runDate") as? Date ?? Date(),
            averageSpeed: defaults.double(forKey: "averageSpeed"),
            distance: defaults.double(forKey: "distance"),
            timeElapsed: defaults.double(forKey: "timeElapsed")
        )
    }
}
