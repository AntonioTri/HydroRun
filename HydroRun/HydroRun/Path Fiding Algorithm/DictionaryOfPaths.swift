//
//  DictionaryOfPaths.swift
//  HydroRun
//
//  Created by Antonio Tridente on 08/11/23.
//


import CoreLocation

extension CLLocationCoordinate2D: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }

    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}


//var dizionario: [Int: [CLLocationCoordinate2D: [CLLocationCoordinate2D]]] = [:]
//
//class DictionaryManager{
//    
//    func AggiungiCollezione(){
//        
//        var 
//        
//     
//        var dizionarioDiCoordinate = dizionario[2]
//        dizionarioDiCoordinate[]
//        
//    }
//    
//    
//    
//}
