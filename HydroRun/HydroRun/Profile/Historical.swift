//
//  UserDataModifier.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI

struct Historical: View {
    @StateObject private var userViewModel = UserViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ShowHistorical()
            }
            .navigationBarItems(trailing: ProfileHeader(userViewModel: userViewModel))

        }
    }
}


struct ModalView: View {
    
    @Binding var modifiedUser: User
    @ObservedObject var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
    
        EditDataView(user: $userViewModel.user, modifiedUser: $modifiedUser)
        
    }
}


#Preview{
    Historical()
}
