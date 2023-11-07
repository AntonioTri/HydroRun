//
//  RicercaNroFontanelle.swift
//  HydroRun
//
//  Created by Antonio Tridente on 04/11/23.
//

import Foundation
import SwiftUI


// Questa è na funzione in realtà molto banale, memorizza le caratteristiche meteo o fisiche dell'utente
// ( Ha bisogno di elementi copia in entrata quindi non bisogna nemmeno impazzire troppo con state e binding )
// e tramite due funzioni "Modificatrici" calcola il numero di fotanelle consigliate

// !!! ATTENZIONE !!! Poichè questa funzione fa uso delle previsioni meteo, le quali hanno bisogno di fare una
// richiesta https ad un server, per non rendere l'app lenta nel fare calcoli, questa viene dichiarata come "asincrona"
// con il protocollo async sottostante

func RicercaNumeroFontanelle() async -> Int{
    
    @State var user = User.shared
    
    print(user.height)
    print(user.weight)
    
    var nroFontanelle = 3
    
    //Ricerca dei valori meteo
    let valoriMeteo = WeatherView()
    valoriMeteo.fetchWeatherData()
    //Estrazione dei valori meteo
    var temperature = valoriMeteo.temperature
    var humidity = valoriMeteo.humidity

    var height = user.height / 100
    if height == 0 {
        height = 1
    }

    //Calcolo dell'indice IBM
    let IBM =  user.weight / (height * height)
    
    //Modificatore Fontanelle tramite il tempo
    temperature = 18
    humidity = 40
    nroFontanelle = WeatherModifier(nroFontanelle: nroFontanelle, temperatura: temperature ?? 20, humidity: humidity ?? 50)
    
    //Modificatore Fontanelle tramite l'indiceIBM
    nroFontanelle = IBMModifier(IBM: Double(IBM), nroFontanelle: nroFontanelle)
    
//    Si possono aggiungere quanti altri modificatori si vogliono di qualunque complessità
    
    //Ritorna il numero di fontanelle modificato
    return nroFontanelle
    
}

// Modificatore del valore delle fontanelle in base al meteo, sono solo un sacco di if
func WeatherModifier(nroFontanelle: Int, temperatura: Double, humidity: Double) -> Int{
    
    var nro = nroFontanelle
    
    if temperatura < 20 && humidity <= 50 { return nro }
    
    if temperatura >= 20 { nro += 1 }
    if temperatura >= 25 { nro += 1 }
    if temperatura >= 30 { nro += 1 }
    if temperatura >= 35 { nro += 1 }

    if humidity <= 60 && temperatura <= 25 { nro -= 1 }
    if humidity > 60 && temperatura >= 30 { nro += 1 }
    if humidity > 70 { nro += 1 }
    if humidity > 85 { nro += 1 }
        
    return nro
    
}

// Modificatore del valore delle fontanelle in base all'indice IBM, anche qui sono un casino di if
func IBMModifier(IBM: Double, nroFontanelle: Int) -> Int{
 
    var nro = nroFontanelle
    
    if IBM <= 18 { nro += 1 }
    if IBM > 18 && IBM <= 24 { nro -= 1 }
    if IBM > 24 { nro += 1 }
    if IBM > 29 { nro += 1 }
    if IBM > 40 { nro += 1 }
    
    return nro
    
}



