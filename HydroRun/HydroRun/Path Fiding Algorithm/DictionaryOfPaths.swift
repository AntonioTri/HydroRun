
import SwiftUI
import CoreLocation
import MapKit

struct Fontane: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let nome: String
}


var p: [MKPlacemark] = fontane.map{ fontana in
          var placemark = MKPlacemark(coordinate: fontana.coordinate)
          return placemark
        }
 

// Array delle fontane ( Hannoanche i nomi ) :
let fontane: [Fontane] = [
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
    Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina")
]


let paths: [String: [Fontane]] = [
    "PG3": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo")
    ],
    "PG4": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
    ],
    "PG5": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
    ],
    "PG6": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
    ],
    "PG7": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        
    ],
    "PG8": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
    ],
    "PP3": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
        
    ],
    "PP4": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        
    ],
    "PP5": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
        
    ],
    "PP6": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci")
    ],
    "PP7": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
        
    ],
    "PP8": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria")
        
    ],
    "PM3": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina")
        
    ],
    "PM4": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),  
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina")
    ],
    "PM5": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci")
    ],
    "PM6": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
    ],
    "PM7": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
    ],
    "PM8": [
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876592, longitude: 14.250561), nome: "Fagianeria"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.878857, longitude: 14.250253), nome: "Casina della Regina"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.876547, longitude: 14.25154), nome: "Capraia"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.877143, longitude: 14.257095), nome: "Fabricato S.Gennaro"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.875176, longitude: 14.253907), nome: "Fontana di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.869202, longitude: 14.251986), nome: "Porta di Mezzo"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.865639, longitude: 14.249892), nome: "Lecci"),
        Fontane(coordinate: CLLocationCoordinate2D(latitude: 40.86977, longitude: 14.250434), nome: "Porta Piccola")
        
    ]
]
