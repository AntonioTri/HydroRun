//
//  TestTimeKM.swift
//  HydroRun
//
//  Created by Luca Di Marco on 06/11/23.
//


import SwiftUI

struct TimerAndKm: View {
    @Binding var pauseTimer: Bool
    
    var body: some View {
      
        VStack{
            Tempo(pauseTimer: $pauseTimer)
            OdometerView(viewModel: OdometerViewModel())
        }
    }
}


