//
//  SwiftUIView.swift
//  Schermata iniziale app
//
//  Created by Luca Di Marco on 30/10/23.
//

import SwiftUI

struct ButtonMaps: View {
    
    var body: some View {
        VStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
            })
            
            Rectangle()
                .frame(width: 50, height: 100)
                .foregroundColor(.white)
                .cornerRadius(12)
                .overlay(
                    
                    VStack {
                        Image(systemName: "map.fill")
                            .foregroundColor(.black)
                            .padding(4)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                            .padding(5)
                        Image(systemName: "location")
                            .foregroundColor(.black)
                            .padding(4)
                        
                                        
                    }
                )
                
        }
    }
}
    
#Preview {
    ButtonMaps()
}
