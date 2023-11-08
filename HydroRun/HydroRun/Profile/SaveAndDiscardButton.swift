//
//  SaveAndDiscardButton.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI

struct SaveAndDismiss: View {
    
    @Binding var user: User
    @Binding var modifiedUser: User
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button("Discard") {
                dismiss()
                modifiedUser = user
            }
            .padding(20)
            
            Spacer()
            
            Button("Save") {
                user = modifiedUser
                modifiedUser.save()
                user.save()
                dismiss()
            }
            .padding(20)
        }
    }
}
