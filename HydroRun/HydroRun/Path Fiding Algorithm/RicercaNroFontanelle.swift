//
//  RicercaNroFontanelle.swift
//  HydroRun
//
//  Created by Antonio Tridente on 04/11/23.
//

import Foundation
import SwiftUI

func RicercaNumeroFontanelle(user: Binding<User>) -> Int{
    
    var nroFontanelle = 3
    
    var valoriMeteo = WeatherView()
    
    let temperature = valoriMeteo.temperature
    let humidity = valoriMeteo.humidity
    let weight = user.weight.wrappedValue
    var height = user.height.wrappedValue
    height = height / 100
    
    let IBM = weight / (height * height)
    
    
    
    
    
    
    
    
    return nroFontanelle
    
}


func ModificatoreTemperatura(nroFontanelle: Int, temperatura: Double, humidity: Double) -> Int{
    
    var nro = nroFontanelle
    
    if temperatura < 18 { return nro }
    if temperatura >= 18 { nro += 1 }
    if temperatura >= 25 { nro += 1 }
    if temperatura >= 30 { nro += 1 }
    if temperatura >= 35 { nro += 1 }
    
    if humidity <= 
    
    return nro
}
