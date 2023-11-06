//
//  EstragoTempo.swift
//  HydroRun
//
//  Created by Antonio on 06/11/23.
//

import Foundation
import SwiftUI

struct SomeOtherView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text("Weather Data in Some Other View")
                .font(.title)

            if let temperature = weatherViewModel.temperature,
               let humidity = weatherViewModel.humidity,
               let pressure = weatherViewModel.pressure {
                Text("Temperature: \(String(format: "%.2f", temperature)) °C")
                Text("Humidity: \(String(format: "%.2f", humidity)) %")
                Text("Pressure: \(pressure) hPa")
            } else {
                Text("Loading data...")
            }
        }
    }
}

struct SomeOtherView_Preview: PreviewProvider {
    static var previews: some View {
        SomeOtherView()
    }
}
