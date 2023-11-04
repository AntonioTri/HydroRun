import SwiftUI
/*
 In questo file vi troviamo diversi elementi che nel complesso servono ad eseguire una HTTPS request ad una API
 per le condiizoni meteo, vengono create le strutture dati capaci di contenere tali dati, tramite dei processi
 di estrazione vengono poi memorizzati in delle variabili ed utilizzati per mostrarli all'untente
 */

//Struttura dati che contiene i campi di interesse, ogni attributo è un campo presente nella JSON Response
struct Main: Codable {
    let temp: Double
    let humidity: Double
    let pressure: Int
}

//Struttura base per contenere i dati JSON
struct WeatherData: Codable {
    let main: Main
}

//I gradi vengono restituiti dalla Request in formato Kelvin, questa funzione esegue la conversione
func KelvinToCelsius(kelvin: Double) -> Double{
    return kelvin - 273.15
}

//Qui si crea la view dei dati, nella struct vi è anche presente una funizone che estrae idati dalla JSON Request
struct WeatherView: View {
    
    //Creo ter variabili State per memorizzare i dati della struct sopra create, quando questa verrà inizializzata
    @State private var temperature: Double?
    @State private var humidity: Double?
    @State private var pressure: Int?

    //Fuzione di "Fetch", estrazione dati, dalla API
    func fetchWeatherData() {
        
        //Si inizializza una variabileall'indirizzo web della API, la chiave utilizzata è quella di Antonio Tridente ( APPID )
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Naples, IT,uk&APPID=e8423e95d3298b67b93efa37eb45782c") else {
            print("URL non valido")
            return
        }

        //Si inizializza una task, un compito da far svolgere al programma in background, questa task è la richiesta HTTPS
        //all' indirizzo web dichiarato in precedenza
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //Se vengono restituiti correttamente i dati dalla API si estraggono dal file json restituito
            if let data = data {
                do {
                    //Estrazione dei dati dal file JSON all'interno della struct
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    temperature = weatherData.main.temp
                    humidity = weatherData.main.humidity
                    pressure = weatherData.main.pressure
                //Viene gestito un errore nel caso la struttura creata in precedenza contenga dei campi non validi
                //o non presenti nella risposta JSON dell'API
                } catch {
                    print("Errore durante l'analisi della risposta: \(error)")
                }
            //Se la API ha commesso un errore di ritorno durante la sua richiesta questo viene gestito
            } else if let error = error {
                print("Errore durante la richiesta API: \(error)")
            }
        }
        //Non lo so qua mi ha aiutato ChatGpt, credo serva a riprendere le altre operazioni dell'app se
        //queste sopra descritte non funzionino
        task.resume()
    }
    
    //Qua viene definito il body della View, di conseguenza quello che viene fatto Startare al momemnto dell'apertura dell'APP
    var body: some View {
        VStack {
            
            //Optional Binding per verificare che le tre caratteristiche raccolte prima nella struct e poi memorizzate
            //nelle variabili non siano null
            if let temperature = temperature, let humidity = humidity, let pressure = pressure {
                
                //Se tutte e tre sono effettivamente state estratte dalla richiesta HTTPS vengono mostrate a schermo e l'utente
                //ne può usufruire, nel nostro caso dovremo usarle per sviluppare l'algoritmo BFS per creare il percorso
                //da consigliare all'untente
                let tempCelsius = KelvinToCelsius(kelvin: temperature)
                Text("Napoli:")
                Text("Temperatura: \(String(format: "%.1f", tempCelsius))°C")
                Text("Umidità: \(String(format: "%.1f", humidity))%")
                Text("Pressione atmosferica : \(pressure)")
                
            //Viene tutto implementato a livello di backrgound dall'attributo .onAppear definito sotto
            } else {
            
                Text("Caricamento dati meteo...")
                
            }
        }
        //Questo attributo permette di svolgere operazioni in backround mentre sulla interfaccia viene mostrato tutt'altro,
        //ad esempio il testo "Caricamento dati meteo ..." mentre la funzione fetchWeatherData() dichiarata sopra fa
        //i suoi calcoli con l'API e tutto il resto
        .onAppear {
            fetchWeatherData()
        }
    }
}


#Preview {
    WeatherView()
}
