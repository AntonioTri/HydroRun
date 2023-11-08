//
//  TestTimeKM.swift
//  HydroRun
//
//  Created by Luca Di Marco on 06/11/23.
//


import SwiftUI

struct TimerAndKm: View {
    
    @Binding var pauseTimer: Bool
    @ObservedObject var viewModel = OdometerViewModel()
    
    //Variabili per il salvataggio dei dati
    @Binding var saveData: Bool
    @State var savedTime: String
    @Binding var savedKilometers: Double
    
    var body: some View {
      
        VStack{
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 360, height: 90)
                .cornerRadius(10)
                .overlay(
                    VStack{
                        
                        
                        HStack{
                            Spacer()
                            Text(" Km Taken:")
                                .bold()
                            Spacer()
                            Spacer()
                            Text("\(String(format: "  %.3f", viewModel.totalDistanceTraveled)) Km")
                                .bold()
                            Spacer()
                        }
                        .onChange(of: saveData){
                            
                            savedKilometers = viewModel.totalDistanceTraveled
                            
                        }

                        Rectangle()
                            .frame(width: 340, height: 1)
                            .foregroundColor(.gray)
                            .padding(4)
                        
                        HStack{
                            Spacer()
                            Text("Time Elapsed:")
                                .bold()
                            Spacer()
                            Spacer()
                            Tempo(pauseTimer: $pauseTimer, saveData: $saveData, savedTime: $savedTime)
                            Spacer()

                        }
                    }
                )

        }
    }
}


