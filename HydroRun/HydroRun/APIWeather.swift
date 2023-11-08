//
//  EstragoTempo.swift
//  HydroRun
//
//  Created by Antonio on 06/11/23.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var temperature: Double?
    @Published var humidity: Double?
    @Published var pressure: Int?

    private func fetchWeatherData() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Naples,IT&APPID=e8423e95d3298b67b93efa37eb45782c") else {
            print("URL non valido")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    temperature = KelvinToCelsius(kelvin: weatherData.main.temp)
                    humidity = weatherData.main.humidity
                    pressure = weatherData.main.pressure
                } catch {
                    print("Errore durante l'analisi della risposta: \(error)")
                }
            } else if let error = error {
                print("Errore durante la richiesta API: \(error)")
            }
        }
        task.resume()
    }

    init() {
        fetchWeatherData()
    }
}

//Struttura di test per vedere se funziona
struct WeatherView_Preview: View {
    @StateObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text("Weather Data")
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

struct WeatherView_Preview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView_Preview()
    }
}
