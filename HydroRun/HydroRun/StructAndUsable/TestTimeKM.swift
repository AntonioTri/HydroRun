//
//  TestTimeKM.swift
//  HydroRun
//
//  Created by Luca Di Marco on 06/11/23.
//


import SwiftUI

struct TestTimeKM: View {
    var body: some View {
      
        VStack{
            Tempo()
            OdometerView(viewModel: OdometerViewModel())
        }
        
    }
}

#Preview {
    TestTimeKM()
}
