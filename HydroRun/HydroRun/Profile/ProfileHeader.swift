//
//  Test.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI

struct ProfileHeader: View {
    
    @ObservedObject var userViewModel: UserViewModel

    var body: some View {

        HStack {
            Text("Profile")
                .font(.system(size: 40))
            .bold()
            .padding(40)
            Spacer()
            EditButton(userViewModel: userViewModel)
                .padding(20)
        }
    }
}
