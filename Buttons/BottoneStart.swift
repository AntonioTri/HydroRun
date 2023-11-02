//
//  BottoneStart.swift
//  HydroRun
//
//  Created by Antonio Tridente on 30/10/23.
//

import SwiftUI

struct BottoneStart: View {
    
    var body: some View {
        
        Button(action: {
            
            
            
        }, label: {
            Circle()
                .frame(width: 60)
                .foregroundColor(.black)
                .overlay(
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                )
        })
    }
}

#Preview {
    BottoneStart()
}
