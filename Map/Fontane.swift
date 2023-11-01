import SwiftUI
import MapKit

//Questa struct identifica le fontanelle, sono identificate da un UUID e da delle coordinate che ci servirano
//per identificarle singolarmente
struct Fontane: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

//Dichiariamo qui un array di struct Fontanelle, ad ognuna assegnamo le sue corrispettive coordinate di
//Latitudine e Longitudine
let fontane: [Fontane] = [

    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095)),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253))

]


