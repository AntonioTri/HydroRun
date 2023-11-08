//
//  Tempo.swift
//  HydroRun
//
//  Created by Luca Di Marco on 05/11/23.
//

import SwiftUI

struct Tempo: View {
    
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @Binding var pauseTimer: Bool
    
    @Binding var saveData: Bool
    @Binding var savedTime: String
    
    var body: some View {
        
        Text(formattedTime(elapsedTime))
            .bold()
            .onAppear(perform: {
                if !self.pauseTimer {
                    startTimer()
                    savedTime = formattedTime(elapsedTime)
                }
            })
        
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if !self.pauseTimer{
                elapsedTime += 1
                savedTime = formattedTime(elapsedTime)
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func formattedTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) % 3600 / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    
}


