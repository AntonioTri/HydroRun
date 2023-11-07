//
//  ContentView.swift
//  HydroRun
//
//  Created by Antonio Tridente on 30/10/23.
//

import SwiftUI
import MapKit
import CoreLocation

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
    @State var timerAndKm = false
    @State var pauseTimer = false
    
    var body: some View {
       
        TabView(selection: $selection){
            ZStack {
                VStack {
                    MostraMappaFontEPos()
                    BottoneStart(timerAndKm: $timerAndKm, pauseTimer: $pauseTimer)
                        .padding(10)
                }
                
                if timerAndKm {
                    TimerAndKm(pauseTimer: $pauseTimer)
                }

                ButtonMaps()
                    .position(x: 350, y: 80)
            }
            
            .tabItem {
                Image(systemName: "figure.run")
                Text("Run")
            }
            .tag(2)
            
            Historical()
            .tabItem {
                Image(systemName: "list.bullet.rectangle.portrait.fill")
                Text("Historical")
            }
            .tag(1)
        }
        .accentColor(.orange)
    }

    let locationManager = CLLocationManager()
    
    

}


#Preview {
    ContentView()
}



