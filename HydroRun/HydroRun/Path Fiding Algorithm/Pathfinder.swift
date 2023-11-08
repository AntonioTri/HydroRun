
//
//  ShoppingMap.swift
//  PayTogether
//
//  Created by Emanuel Di Nardo on 08/11/23.
//

import SwiftUI
import MapKit


struct PathFinder: View {
    
    @State private var region = MKCoordinateRegion(center: fontane[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    @State private var routes: [MKRoute] = []
    @State private var selectedResult: MKMapItem?
    
    //Questa deve essere una variabile Binding
    @Binding var pathName: String
    
    var body: some View {
        Map(selection: $selectedResult) {
            ForEach(paths[pathName]!, id: \.id) {
                path in
                Marker(path.nome, coordinate: path.coordinate)
            }
            
            if !routes.isEmpty {
                ForEach(routes, id: \.self) {
                    route in
                    MapPolyline(route)
                        .stroke(.blue, lineWidth: 5)
                }
                
            }
        }
        .onChange(of: selectedResult, {
            getDirections()
        })
        .onAppear {
            self.selectedResult = MKMapItem(placemark: MKPlacemark(coordinate: paths[pathName]!.last!.coordinate))
       }
    }
    
    func getDirections() {
        self.routes.removeAll()
        
        let path = paths[self.pathName]!
        
        for i in 0..<path.count-1 {
            let request = MKDirections.Request()
            request.transportType = .walking
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: path[i].coordinate))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: path[1+i].coordinate))
            Task {
                let directions = MKDirections(request: request)
                let response = try? await directions.calculate()
                if let route = response?.routes.first {
                    routes.append(route)
                }
            }
        }
       
    }
}

