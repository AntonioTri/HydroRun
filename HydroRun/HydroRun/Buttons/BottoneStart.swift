//
//  BottoneNuovo.swift
//  HydroRun
//
//  Created by Antonio Tridente on 05/11/23.
//

import SwiftUI

struct BottoneStart: View {
    
    
    //Variabili di ambiente
    @State private var isRunning = false
    @State private var isPaused = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var startTimerOnPlay = false
    
    @Binding var timerAndKm: Bool
    @Binding var pauseTimer: Bool
    
    //Variabili di start e stop dei bottoni
    @State private var showStartButton = true
    @State private var showingStopConfirmation = false
    @State private var showPauseStopButtons = false

    @State private var nroFontanelle = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var formattedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = (Int(elapsedTime) % 3600) / 60
        let seconds = Int(elapsedTime) % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    

    var body: some View {
        
        
        
        ZStack {
            
            if showStartButton {
                
                Button (action: {
                    
                    showStartButton = false
                    showPauseStopButtons = true
                    
                    isRunning = true
                    isPaused = false
                    
                    timerAndKm = true
                    pauseTimer = true
                    
                }, label: {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                    )
                })
                .contentShape(Circle())
            }
            
            if showPauseStopButtons {

                HStack {
                    Spacer()
                    Button(action: {
                        showingStopConfirmation = true
                    }) {
                        Circle()
                            .frame(width: 60)
                            .foregroundColor(.orange)
                            .overlay(
                                Image(systemName: "stop.fill")
                                    .foregroundColor(.white)
                            )
                            
                    }
                    .contentShape(Circle())
                    Spacer()

                    Button(action: {
                        isPaused.toggle()
                        startTimerOnPlay = true
                        isRunning = true
                        pauseTimer.toggle()
                        
                    }) {
                        Circle()
                            .frame(width: 60)
                            .foregroundColor(.black)
                            .overlay(
                                Image(systemName: isPaused ? "play.fill" : "pause.fill")
                                    .foregroundColor(.white)
                            )
                            
                    }
                    .contentShape(Circle())
                    Spacer()
                }
           }
        }
        .onReceive(timer) { _ in
            if isRunning && !isPaused {
                elapsedTime += 1
            }
        }
        .alert(isPresented: $showingStopConfirmation) {
            Alert(
                title: Text("Stop Timer"),
                message: Text("Do you want to stop the timer?"),
                primaryButton: .default(Text("Yes")) {
                    isRunning = false
                    showPauseStopButtons = false
                    showStartButton = true
                    elapsedTime = 0
                    timerAndKm = false
                    
                    historicals.append(HistoricalTemplate(kmTaken: 4, time: formattedTime, medVelocity: 6, WaterStops: 9))
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
    }
}

