//
//  ProfileEditButton.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI



struct EditButton: View {
    
    @State var modifiedUser = User()
    @ObservedObject var userViewModel: UserViewModel
    @State private var showingSheet = false

    var body: some View {
        Button(action: { showingSheet.toggle() }) {
            Image(systemName: "pencil.circle")
        }
        .sheet(isPresented: $showingSheet) {
            ModalView(modifiedUser: $modifiedUser, userViewModel: userViewModel)
        }
    }
}
