//
//  UserDataDisplay.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI
struct UserDataDisplay: View {
    
    @ObservedObject var userViewModel: UserViewModel

    var body: some View {
        Form {
            Section(header: Text("Personal data:")) {
                Text("Nickname: \(userViewModel.user.nickname)")
                Text("Age: \(userViewModel.user.age)")
                Text("Height: \(String(format: "%.0f", userViewModel.user.height)) cm")
                Text("Weight: \(String(format: "%.0f", userViewModel.user.weight)) kg")
                Text("Fitness Level: \(userViewModel.user.fitnessLevel)")
            }
        }
    }
}


