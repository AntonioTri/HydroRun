
import SwiftUI

struct fburw: View{

    @State private var temperature: Double?
    @State private var humidity: Double?
    @State private var pressure: Int?
    
    var monitor = WeatherView()
    
    var body: some View {
        
        VStack {
            
            if monitor.fetchWeatherData(){
                
                if let temperature = monitor.temperature, let humidity = monitor.humidity, let pressure = monitor.pressure {

                    // Conversione della temperatura da Kelvin a Celsius
                    let tempCelsius = KelvinToCelsius(kelvin: temperature)
                    
                    // Visualizzazione dei dati meteorologici
                    Text("Napoli:")
                    Text("Temperatura: \(String(format: "%.1f", tempCelsius))°C")
                    Text("Umidità: \(String(format: "%.1f", humidity))%")
                    Text("Pressione atmosferica : \(pressure)")
                    
                } else {
                    // Messaggio di caricamento durante il recupero dei dati
                    Text("Caricamento dati meteo...")
                }
            }
        }
    }
}


#Preview {
    fburw()
}



