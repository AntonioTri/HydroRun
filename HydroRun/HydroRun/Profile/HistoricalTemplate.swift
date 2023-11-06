//
//  HistoricalTemplate.swift
//  HydroRun
//
//  Created by Antonio Tridente on 06/11/23.
//


//Serve un costruttore, si crea l'oggetto e poi viene mostrato, fatto un append sulla lista
import SwiftUI

var historicals: [HistoricalTemplate] = [
    
    HistoricalTemplate(kmTaken: 100, time: "00:49:32'", medVelocity: 8, WaterStops: 3),
    HistoricalTemplate(kmTaken: 100, time: "00:49:32'", medVelocity: 8, WaterStops: 3)
    
]

struct ShowHistorical: View{
    var body: some View{
        
        List(historicals.indices, id: \.self){ index in
        
            historicals[index]
            
        }
    }
}

struct HistoricalTemplate: View {
    
    let kmTaken: Int
    let time: String
    let medVelocity: Int
    let WaterStops: Int
    
    var body: some View {
        
        Section(header: Text("01/10/2023").position(x:159) .bold()){
                HStack{
                    Text("Km taken: ")
                    Spacer()
                    Text("\(kmTaken) km")
                }
                HStack{
                    Text("Time: ")
                    Spacer()
                    Text(time)
                }
                HStack{
                    Text("Medium velocity: ")
                    Spacer()
                    Text("\(medVelocity) km/h")
                }
                HStack{
                    Text("WaterStops: ")
                    Spacer()
                    Text("\(WaterStops)")
                }
            }
        }
    }

#Preview {
    ShowHistorical()
}
