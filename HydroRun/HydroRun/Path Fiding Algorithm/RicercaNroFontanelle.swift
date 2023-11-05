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

func RicercaNumeroFontanelle(user: User) async -> Int{
    
    var nroFontanelle = 3
    
    //Ricerca dei valori meteo
    let valoriMeteo = WeatherView()
    
    //Estrazione dei valori meteo
    let temperature = valoriMeteo.temperature
    let humidity = valoriMeteo.humidity
    let height = user.height / 100
    
    //Calcolo dell'indice IBM
    let IBM =  user.weight / (height * height)
    
    //Modificatore Fontanelle tramite il tempo
    nroFontanelle = await WeatherModifier(nroFontanelle: nroFontanelle, temperatura: temperature ?? 20, humidity: humidity ?? 50)
    
    //Modificatore Fontanelle tramite l'indiceIBM
    nroFontanelle = await IBMModifier(IBM: IBM, nroFontanelle: nroFontanelle)
    
//    Si possono aggiungere quanti altri modificatori si vogliono di qualunque complessità
    
    //Ritorna il numero di fontanelle modificato
    return nroFontanelle
    
}

// Modificatore del valore delle fontanelle in base al meteo, sono solo un sacco di if
func WeatherModifier(nroFontanelle: Int, temperatura: Double, humidity: Double) async -> Int{
    
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
func IBMModifier(IBM: Double, nroFontanelle: Int) async -> Int{
 
    var nro = nroFontanelle
    
    if IBM <= 18 { nro += 1 }
    if IBM > 18 && IBM <= 24 { nro -= 1 }
    if IBM > 24 { nro += 1 }
    if IBM > 29 { nro += 1 }
    if IBM > 40 { nro += 1 }
    
    return nro
    
}
