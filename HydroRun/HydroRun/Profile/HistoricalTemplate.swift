//
//  HistoricalTemplate.swift
//  HydroRun
//
//  Created by Antonio Tridente on 06/11/23.
//


//Serve un costruttore, si crea l'oggetto e poi viene mostrato, fatto un append sulla lista
import SwiftUI


struct ShowHistorical: View{
    
    
    @State var historicals: [SavedDataKmTimer] = loadData(type: [SavedDataKmTimer].self, key: "Storico") ?? []{
        
        willSet {
            saveData(array: newValue, key: "Storico")
        }
        
    }

    var body: some View{
        
        List(historicals.indices, id: \.self){ index in
        
            HistoricalTemplate(kmTaken: historicals[index].kmTaken, time: historicals[index].time, WaterStops: historicals[index].nrFontanelle)
            
        }
        .onAppear{
            
            historicals = loadData(type: [SavedDataKmTimer].self, key: "Storico") ?? []
            
        }
    }
}

struct HistoricalTemplate: View {
    
    var kmTaken: Double
    var time: String
    var WaterStops: Int
    
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
