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
    
    @State var nroFontanelle = RicercaNumeroFontanelle()
    Thread.sleep(forTimeInterval: 0.5)
    let nearestLocation = NearestLocation()
    
    var key = ""
    
    switch nearestLocation.result {
        
    case 1:
        key = key + "PP"
    case 2:
        key = key + "PM"
    case 3:
        key = key + "PG"
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
    
    print(nearestLocation.result)
    print("nroFontanelle: \(nroFontanelle)")
    print(key)
    return key
}

class NearestLocation {
    
    @ObservedObject private var locationManager = LocationManager()

    private let portaPiccola = CLLocation(latitude: 40.869719, longitude: 14.250227)
    private let portaMiano = CLLocation(latitude: 40.879147, longitude: 14.249333)
    private let portaGrande = CLLocation(latitude: 40.865984, longitude: 14.252219)
    public var result = 0

    private func nearestPointOfInterest() -> Int {

        let distances: [Double] = [
            DistanceFrom(x1: locationManager.latitude, y1: locationManager.longitude, x2: portaMiano.coordinate.latitude, y2: portaMiano.coordinate.longitude),
            DistanceFrom(x1: locationManager.latitude , y1: locationManager.longitude, x2: portaGrande.coordinate.latitude, y2: portaGrande.coordinate.longitude),
            DistanceFrom(x1: locationManager.latitude, y1: locationManager.longitude, x2: portaPiccola.coordinate.latitude, y2: portaPiccola.coordinate.longitude),
        ]
        
        let index = GetMinIndex(a: distances)
        
        switch (index) {
            
            case 0:
            print("Miano")
                return 1
            case 1:
            print("Piccola")
                return 2
            case 2:
            print("Grande")
                return 3
            default:
                return 1
            }
        
        
    }
    
    init(){
        result = nearestPointOfInterest()
    }
}


func DistanceFrom(x1: Double, y1: Double, x2: Double, y2: Double) -> Double{
    
    let distance = sqrt( pow(( x2 - x1 ), 2) + pow(( y2 - y1 ), 2))
    
    return distance
    
}

func GetMinIndex(a: [Double]) -> Int {
    
    var minIndex: Int = 0
    var value: Double = a[0]
    
    for i in 1...a.count - 1 {
        
        if a[i] < value {
            value = a[i]
            minIndex = i
        }
        
    }
    
    return minIndex
}

