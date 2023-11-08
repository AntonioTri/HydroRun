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
                
                Section(header: Text("Modify your data")) {
                    
                    HStack {
                        Text("Nickname:")
                        TextField("Enter your nickname", text: $modifiedUser.nickname)
                            .keyboardType(.default)
                    }
                    
                    HStack {
                        Text("Age:")
                        TextField("Enter your age", text: Binding(
                            get: { String(modifiedUser.age) },
                            set: { text in
                                if let age = Int(text) {
                                    modifiedUser.age = age
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                    }

                    
                    HStack {
                        Text("Height:")
                        TextField("Enter your height", text: Binding(
                            get: { String(modifiedUser.height) },
                            set: { text in
                                if let height = Int(text) {
                                    modifiedUser.height = height
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                    }

                    
                    HStack {
                        Text("Weight:")
                        TextField("Enter your weight", text: Binding(
                            get: { String(modifiedUser.weight) },
                            set: { text in
                                if let weight = Int(text) {
                                    modifiedUser.weight = weight
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                    }

                    
                    HStack {
                        Text("Fitness (1-10):")
                        TextField("Enter your fitness level", text: Binding(
                            get: { String(modifiedUser.fitnessLevel) },
                            set: { modifiedUser.fitnessLevel = min(max(1, Int($0) ?? 1), 10) }
                        ))
                        .keyboardType(.numberPad)
                    }
                }
            }
        }
    
}
