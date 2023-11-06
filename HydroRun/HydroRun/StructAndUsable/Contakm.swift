//
//  Contakm.swift
//  HydroRun
//
//  Created by Luca Di Marco on 06/11/23.
//

import SwiftUI
import CoreLocation

class OdometerViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var totalDistanceTraveled: Double = 0.0
    private var locationManager = CLLocationManager()
    private var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        if let lastLocation = lastLocation {
            let distanceInMetres = location.distance(from: lastLocation)
            totalDistanceTraveled += distanceInMetres / 1000 // Convert to kilometers
        }

        lastLocation = location
    }
}

struct OdometerView: View {
    @ObservedObject var viewModel: OdometerViewModel

    var body: some View {
        Rectangle()
            .frame(width: 300, height: 45)
            .foregroundColor(.blue)
            .cornerRadius(10)
            .overlay(
                VStack {
                    Text("\(String(format: "%.2f", viewModel.totalDistanceTraveled)) km")
                        .font(.largeTitle)
                        .padding()
                }
            )
    }
}



        #Preview {
            OdometerView(viewModel: OdometerViewModel())
        }
