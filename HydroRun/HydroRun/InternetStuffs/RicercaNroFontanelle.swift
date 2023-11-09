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

func RicercaNumeroFontanelle() -> Int{

    @State var user = User()

    var nroFontanelle = 3

    //Ricerca dei valori meteo
    @StateObject var weatherViewodel = WeatherViewModel()
    Thread.sleep(forTimeInterval: 0.5)

    //Estrazione dei valori meteo
    if let temperature = weatherViewodel.temperature,
       let humidity = weatherViewodel.humidity{
        //Modificatore Fontanelle tramite il tempo
        nroFontanelle = WeatherModifier(nroFontanelle: nroFontanelle, temperatura: temperature , humidity: humidity )
        print("Temperature: \(temperature)")
        print("Humidity: \(humidity)")
    }
    

    var height: Double = Double(user.height) / 100
    if height == 0 {
        print("test")
        height = 1
    }
    
    //Calcolo dell'indice IBM
    let IBM: Double = Double(user.weight) / (height * height)
    //Modificatore Fontanelle tramite l'indiceIBM
    nroFontanelle = IBMModifier(IBM: Double(IBM), nroFontanelle: nroFontanelle)
    //Ritorna il numero di fontanelle modificato
    if nroFontanelle > 8 { nroFontanelle = 8 }
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
    else {
        if IBM > 24 { nro += 1 }
        if IBM > 29 { nro += 1 }
        if IBM > 40 { nro += 1 }
    }
    
    
    return nro
    
}



