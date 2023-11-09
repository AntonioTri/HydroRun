//
//  ProfileEditButton.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI



struct EditButton: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var modifiedUser: UserViewModel
    @State private var showingSheet = false

    var body: some View {
        Button(action: { showingSheet.toggle() }) {
            Image(systemName: "person.circle")
                .font(.system(size: 20))
        }
        .sheet(isPresented: $showingSheet) {
            ModalView(modifiedUser: modifiedUser, userViewModel: userViewModel)
        }
    }
}

struct ModalView: View {
    
    @ObservedObject var modifiedUser: UserViewModel
    @ObservedObject var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
    
        EditDataView(user: $userViewModel.user, modifiedUser: $modifiedUser.user)
        
    }
}
