//
//  ContentView.swift
//  HydroRun0.01
//
//  Created by Antonio on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var user = User.shared
    @State private var isEditingData = false
    @State private var isRunning = false

    var body: some View {
        NavigationView {
            VStack {
                DataDisplayView(user: $user)
                if isRunning {
                    RunningView(user: $user, isRunning: $isRunning)
                }
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

struct RunningView: View {
    // MARK: - Properties
    @Binding var user: User
    @Binding var isRunning: Bool

    var body: some View {
        Form {
            Section(header: Text("Running Data")) {
                if let runData = user.runData {
                    Text("Date: \(runData.date.description)")
                    Text("Average Speed: \(String(format: "%.2f", runData.averageSpeed) + " m/s")")
                    Text("Distance: \(String(format: "%.2f", runData.distance) + " m")")
                    Text("Time Elapsed: \(String(format: "%.2f", runData.timeElapsed) + " s")")
                } else {
                    Text("No running data available.")
                }
            }
        }
    }
}

struct EditDataView: View {
    // MARK: - Properties
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
                    .font(.title)
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
    // MARK: - Properties
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
          
            Section(header: Text("Historical").font(.largeTitle)) {
                if user.historicalRunData.isEmpty {
                    Text("No historical running data available.")
                } else {
                    ForEach(user.historicalRunData, id: \.date) { historicalRun in
                        HStack {
                            Text("Date: \(historicalRun.date.description)")
                            Spacer()
                            Text("Distance: \(String(format: "%.2f", historicalRun.distance) + " m")")
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Profile")
    }
}

// Preview for the ContentView
#Preview {
    ContentView()
}
