//
//  User.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//

import Foundation

struct User {
    
    var isInitialLaunch: Bool
    var nickname: String
    var age: Int
    var height: Double
    var weight: Double
    var fitnessLevel: Int
    var runData: RunData?
    
    public init (){
        
        self.isInitialLaunch = false
        self.nickname = ""
        self.age = 0
        self.height = 0
        self.weight = 0
        self.fitnessLevel = 1
        self.runData = nil
        
    }

    
    // Inizializzatore privato per creare un'istanza di User
    private init(isInitialLaunch: Bool, nickname: String, age: Int, height: Double, weight: Double, fitnessLevel: Int, runData: RunData? = nil) {
        self.isInitialLaunch = isInitialLaunch
        self.nickname = nickname
        self.age = age
        self.height = height
        self.weight = weight
        self.fitnessLevel = fitnessLevel
        self.runData = runData
    }

    // Metodo per salvare i dati dell'utente con UserDefaults
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(isInitialLaunch, forKey: "isInitialLaunch")
        defaults.set(nickname, forKey: "nickname")
        defaults.set(age, forKey: "age")
        defaults.set(height, forKey: "height")
        defaults.set(weight, forKey: "weight")
        defaults.set(fitnessLevel, forKey: "fitnessLevel")

        // Aggiungi la gestione del salvataggio dei dati di corsa
        if let runData = runData {
            runData.save()
        }
    }

    // Metodo per avviare una corsa e registrare i dati
    mutating func startRun(averageSpeed: Double, distance: Double, timeElapsed: TimeInterval) {
        let runData = RunData(date: Date(), averageSpeed: averageSpeed, distance: distance, timeElapsed: timeElapsed)
        self.runData = runData
    }

    // Metodo per completare una corsa e salvare i dati
    mutating func completeRun() {
        self.save() // Salva i dati dell'utente e della corsa
    }
}

// Metodo statico per ottenere l'istanza con i dati dell'utente
extension User {
    static var shared: User {
        let defaults = UserDefaults.standard
        return User(
            isInitialLaunch: defaults.bool(forKey: "isInitialLaunch"),
            nickname: defaults.string(forKey: "nickname") ?? "",
            age: defaults.integer(forKey: "age"),
            height: defaults.double(forKey: "height"),
            weight: defaults.double(forKey: "weight"),
            fitnessLevel: defaults.integer(forKey: "fitnessLevel"),
            runData: RunData.shared // Carica i dati della corsa
        )
    }
}


class UserViewModel: ObservableObject {
    @Published var user: User

    init() {
        self.user = User.shared
    }

    func saveUser() {
        user.save()
    }
}
