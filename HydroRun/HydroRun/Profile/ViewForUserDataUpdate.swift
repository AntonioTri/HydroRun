//
//  ContentView.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//
import SwiftUI

struct EditDataView: View {
    
    @Binding var user: User
    @Binding var modifiedUser: User
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        
            SaveAndDismiss(user: $user, modifiedUser: $modifiedUser)
        
            Form {
                
                Section(header: Text("Enter your data")) {
                    
                    HStack {
                        Text("Nickname:")
                        TextField("Enter your nickname", text: Binding(
                            get: {String(user.nickname)},
                            set: {modifiedUser.nickname = String($0) }
                        
                        ))
                        .keyboardType(.default)
                    }
                    
                    HStack {
                        Text("Age:")
                        TextField("Enter your age", text: Binding(
                            get: { String(user.age) },
                            set: { modifiedUser.age = Int($0) ?? 0 }
                        ))
                        .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("Height (cm):")
                        TextField("Enter your height (cm)", text: Binding(
                            get: { String(user.height) },
                            set: { modifiedUser.height = Double($0) ?? 0.0 }
                        ))
                        .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Weight (kg):")
                        TextField("Enter your weight (kg)", text: Binding(
                            get: { String(user.weight) },
                            set: { modifiedUser.weight = Double($0) ?? 0.0 }
                        ))
                        .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Fitness (1-10):")
                        TextField("Enter your fitness level", text: Binding(
                            get: { String(user.fitnessLevel) },
                            set: { modifiedUser.fitnessLevel = min(max(1, Int($0) ?? 1), 10) }
                        ))
                        .keyboardType(.numberPad)
                    }
                }
            }
        }
    
}
