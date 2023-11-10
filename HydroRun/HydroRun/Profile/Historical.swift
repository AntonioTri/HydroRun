//
//  UserDataModifier.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI

struct Historical: View {
    @StateObject private var userViewModel = UserViewModel()
    @StateObject var modifiedUser = UserViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ShowHistorical()
            }
            .navigationBarItems(trailing: ProfileHeader(userViewModel: userViewModel, modifiedUser: modifiedUser))

        }
    }
}





#Preview{
    Historical()
}
