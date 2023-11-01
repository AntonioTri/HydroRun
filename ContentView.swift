//
//  ContentView.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//

import SwiftUI
struct ShowUserData: View {
    @State private var user = User.shared
    @State private var isEditingData = false

    var body: some View {
        NavigationView {
            VStack {
                DataDisplayView(user: $user)
            }
            .navigationBarItems(trailing: Button(action: {
                isEditingData.toggle()
            }) {
                Image(systemName: "pencil.circle")
            })
            .fullScreenCover(isPresented: $isEditingData, onDismiss: {
                // Actions to perform when the modal is dismissed, if needed
            }, content: {
                EditDataView(user: $user)
            })
        }
        .onAppear {
            user = User.shared
        }
    }
}

struct EditDataView: View {
    @Binding var user: User
    @Environment(\.dismiss) var dismiss

    var body: some View {
            HStack {
                Spacer()
                Button(action: {
                    user.save()
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title) // Imposta la dimensione dell'icona
                }
            }
            
            
            Form {
                Section(header: Text("Enter your data")) {
                    HStack {
                        Text("Nickname:")
                        TextField("Enter your nickname", text: $user.nickname)
                    }
                    
                    HStack {
                        Text("Age:")
                        TextField("Enter your age", text: Binding(
                            get: { String(user.age) },
                            set: { user.age = Int($0) ?? 0 }
                        ))
                        .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("Height (cm):")
                        TextField("Enter your height (cm)", text: Binding(
                            get: { String(user.height) },
                            set: { user.height = Double($0) ?? 0.0 }
                        ))
                        .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Weight (kg):")
                        TextField("Enter your weight (kg)", text: Binding(
                            get: { String(user.weight) },
                            set: { user.weight = Double($0) ?? 0.0 }
                        ))
                        .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Fitness (1-10):")
                        TextField("Enter your fitness level", text: Binding(
                            get: { String(user.fitnessLevel) },
                            set: { user.fitnessLevel = min(max(1, Int($0) ?? 1), 10) }
                        ))
                        .keyboardType(.numberPad)
                    }
                }
            }
            .navigationBarTitle("Edit User Data")
        }
}

struct DataDisplayView: View {
    @Binding var user: User

    var body: some View {
        Form {
            Section(header: Text("User Data")) {
                Text("Nickname: \(user.nickname)")
                Text("Age: \(user.age)")
                Text("Height: \(String(format: "%.0f", user.height)) cm")
                Text("Weight: \(String(format: "%.0f", user.weight)) kg")
                Text("Fitness Level: \(user.fitnessLevel)")
            }
        }
        .navigationBarTitle("Profile")
    }
}


#Preview {
    ContentView()
}


