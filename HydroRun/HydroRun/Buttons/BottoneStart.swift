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
    @State private var startTimerOnPlay = false
    
    @Binding var timerAndKm: Bool
    @Binding var pauseTimer: Bool
        
    //Variabili di start e stop dei bottoni
    @State private var showStartButton = true
    @State private var showingStopConfirmation = false
    @State private var showPauseStopButtons = false
    
    //Dati salvati
    @Binding var saveDataflag: Bool
    @Binding var savedTime: String
    @Binding var savedKilometers: Double

    @State private var nroFontanelle = 0
    
    

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
        
        .alert(isPresented: $showingStopConfirmation) {
            Alert(
                title: Text("Stop Run"),
                message: Text("Do you want to stop and save the current run?"),
                primaryButton: .default(Text("No") ),
                secondaryButton: .cancel(Text("Yes")){

                        isRunning = false
                        showPauseStopButtons = false
                        showStartButton = true
                        timerAndKm = false

                        saveDataflag = true
                    
                    Thread.sleep(forTimeInterval: 0.1)
                    
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
