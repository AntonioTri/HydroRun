//
//  Test.swift
//  HydroRun
//
//  Created by Antonio Tridente on 03/11/23.
//

import SwiftUI

struct ProfileHeader: View {
    
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var modifiedUser: UserViewModel
    @State var user = User.shared

    var body: some View {
        
        ZStack{
            
            Spacer()
            
            HStack{
                Title()
                    .frame(maxWidth: .infinity) // Per far sì che il titolo occupi tutto lo spazio disponibile
                    .font(.system(size: 40))
                    .bold()
                    .padding(30)
                Spacer()
            }
            
            HStack{
                Spacer()
                EditButton(userViewModel: userViewModel, modifiedUser: modifiedUser)
                    .padding(10)
            }
        }
    }
}

struct Title: View {
    var body: some View {
        Text("Historical")
            .position(x:30)
    }
}


#Preview {
    ProfileHeader(userViewModel: UserViewModel(), modifiedUser: UserViewModel())
}
