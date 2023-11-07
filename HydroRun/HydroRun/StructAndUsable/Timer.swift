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
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 300, height: 45)
            .cornerRadius(10)
            .overlay(
        Text(formattedTime(elapsedTime))
            .font(.system(size: 35))
            .onAppear(perform: {
                    startTimer()
            })
            .onDisappear(perform: {
                stopTimer()
            })
    )}
    
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if pauseTimer{
                elapsedTime += 1
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


