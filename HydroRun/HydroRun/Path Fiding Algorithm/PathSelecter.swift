//
//  PathSelecter.swift
//  HydroRun
//
//  Created by Antonio Tridente on 08/11/23.
//

import Foundation
import SwiftUI
import CoreLocation


struct StartPath: View{
    
    @State var path = PathSelecter()
    
    var body: some View{
        
        PathFinder(pathName: $path)
        
    }
}


func PathSelecter() -> String{
    
    var nearestLocation = NearestLocation()
    
    @State var nroFontanelle = RicercaNumeroFontanelle()
    Thread.sleep(forTimeInterval: 1)
    
    var key = ""
    
    switch nearestLocation.result {
        
    case 1:
        key = key + "PP"
    case 2:
        key = key + "PG"
    case 3:
        key = key + "PM"
    default:
        key = key + "PP"

    }
    
    
    switch (nroFontanelle){
        
    case 3:
        key = key + "3"
    case 4:
        key = key + "4"
    case 5:
        key = key + "5"
    case 6:
        key = key + "6"
    case 7:
        key = key + "7"
    case 8:
        key = key + "8"
    default:
        key = key + "3"
        
    }
    
    return key
}

class NearestLocation {
    
    @ObservedObject private var locationManager = LocationManager()

    private let portaPiccola = CLLocation(latitude: 40.869719, longitude: 14.250227)
    private let portaMiano = CLLocation(latitude: 40.879147, longitude: 14.249333)
    private let portaGrande = CLLocation(latitude: 40.865984, longitude: 14.252219)
    public var result = 0

    private func nearestPointOfInterest() -> Int {
        let currentLocation = CLLocation(latitude: locationManager.latitude, longitude: locationManager.longitude)

        let distances: [CLLocationDistance] = [
            currentLocation.distance(from: portaPiccola),
            currentLocation.distance(from: portaGrande),
            currentLocation.distance(from: portaMiano)
        ]

        if let minDistance = distances.min(),
           let index = distances.firstIndex(of: minDistance) {
            switch index {
            case 0:
                return 1
            case 1:
                return 2
            case 2:
                return 3
            default:
                return 1
            }
        }

        return 1
    }
    
    init(){
        result = nearestPointOfInterest()
    }
}
