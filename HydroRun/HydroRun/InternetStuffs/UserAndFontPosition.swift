import SwiftUI
import MapKit
import CoreLocation

//In questo file troviamo la struct View che ci permette di vedere la posizione dlle fontanelle nel parco
struct MostraMappaFontEPos: View{
    
    let locationManager = CLLocationManager()
    
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 40.874264,longitude: 14.254168),
        span: .init(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    @ObservedObject var user = LocationManager()
    var body: some View{
        
        //Si inizializza una mappa
        Map(){
            
            
    
            //Si esegue un ForEach che parte da 0 ed arriva al size dell nostro array fontanelle
            ForEach(0..<8) { i in
//                Con una closure andiamo a creare annotazioni sulla mappa aggiungendo un cerchio blu per ogni posizione
//                etratta dall'array di posizione i, scriviamo inolter "fontanella" su ogni anotazione
                Annotation(fontane[i].nome, coordinate: fontane[i].coordinate){
                
                //L'icona è da rivedere ...
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .font(.system(size: 100))
                        Circle()
                            .foregroundColor(.blue)
                            .font(.system(size: 10))
                
                    }
                }
            }
            
            Annotation("Tu", coordinate: CLLocationCoordinate2D(latitude: user.latitude, longitude: user.longitude), content: {     ZStack{
                Circle()
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                Circle()
                    .foregroundColor(.red)
                    .font(.system(size: 10))
        
            }})
           
        }
    }
}


#Preview {
    MostraMappaFontEPos()
}

//Queta linea di codice non da errore e credo sia anche corretta
//Va aggiunta la segguente istanza della classe LocationManager: @ObservedObject var location = LocationManager()
// Marker(cooridnate: CLLocation(latitude: location.latitude, longitude: location.longitude))
