//
//  User.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//

import Foundation

struct User {
    
    public var nickname = ""
    public var age = 1
    public var height = 170
    public var weight = 75
    public var fitnessLevel = 1

    
    init(){
        
        self.nickname = ""
        self.age = 1
        self.height = 170
        self.weight = 75
        self.fitnessLevel = 1
        
    }
    
    // Inizializzatore privato per creare un'istanza di User
    private init(nickname: String, age: Int, height: Double, weight: Double, fitnessLevel: Int) {
        self.nickname = ""
        self.age = 1
        self.height = 170
        self.weight = 75
        self.fitnessLevel = 1
    }

    // Metodo per salvare i dati dell'utente con UserDefaults
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(nickname, forKey: "nickname")
        defaults.set(age, forKey: "age")
        defaults.set(height, forKey: "height")
        defaults.set(weight, forKey: "weight")
        defaults.set(fitnessLevel, forKey: "fitnessLevel")
        
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
            nickname: defaults.string(forKey: "nickname") ?? "",
            age: defaults.integer(forKey: "age"),
            height: defaults.double(forKey: "height"),
            weight: defaults.double(forKey: "weight"),
            fitnessLevel: defaults.integer(forKey: "fitnessLevel")
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
