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
            
            Rectangle()
                .frame(width: 50, height: 100)
                .foregroundColor(.white)
                .cornerRadius(5)
                .overlay(
                    
                    VStack {
                        Button(action: {}, label: {
                            Image(systemName: "map.fill")
                                .foregroundColor(.black)
                                .padding(5)
                        })
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.black)
                            .padding(5)
                        Button(action: {}, label: {
                            Image(systemName: "location")
                                .foregroundColor(.black)
                                .padding(5)
                        })
                        
                    }
                )
            
        }
    }
}
    


#Preview {
    ButtonMaps()
}
