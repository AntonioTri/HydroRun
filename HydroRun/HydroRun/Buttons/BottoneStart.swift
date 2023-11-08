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
    
    //Dati salvati
    @Binding var saveDataflag: Bool
    @State var savedTime: String
    @State var savedKilometers: Double

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
                    pauseTimer = false
                    
                    Task {
                        nroFontanelle = await RicercaNumeroFontanelle()
                    }
                    
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
                title: Text("Stop Run"),
                message: Text("Do you want to stop and save the current run?"),
                primaryButton: .default(Text("No") ),
                secondaryButton: .cancel(Text("Yes")){
                    
                        isRunning = false
                        showPauseStopButtons = false
                        showStartButton = true
                        elapsedTime = 0
                        timerAndKm = false
                        saveDataflag = true
                    
                        Thread.sleep(forTimeInterval: 1.0)
                    
                        let newHistorical = SavedDataKmTimer(kmTaken: savedKilometers, time: savedTime, nrFontanelle: nroFontanelle)
                    
                        var historicals: [SavedDataKmTimer] = loadData(type: [SavedDataKmTimer].self, key: "Storico") ?? []
                            
                        historicals.append(newHistorical)
                        saveData(array: historicals, key: "Storico")
                    
                        saveDataflag = false
                    
                }
            )
        }
    }
}


struct SavedDataKmTimer: Codable {
    
    let kmTaken: Double
    let time: String
    let nrFontanelle: Int
    
}
