//
//  ContentView.swift
//  HydroRun
//
//  Created by Antonio Tridente on 30/10/23.
//

import SwiftUI

import SwiftUI

@main
struct HydroRunApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
       
        TabView(selection: $selection){
            
            Text("Ti trovi nel tuo profilo")
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            .tag(1)
            
            
            VStack {
                MostraMappaFontane()
                BottoneStart()
                    .padding(10)
            }
            
            .tabItem {
                Image(systemName: "figure.run")
                Text("Run")
                    
            }
            .tag(2)
        }
        .accentColor(.orange)
    }
}


#Preview {
    ContentView()
}



