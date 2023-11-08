//
//  MapViewApple.swift
//  HydroRun
//
//  Created by Antonio Tridente on 07/11/23.
//

import SwiftUI
import MapKit


struct MapViewApple: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotation: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
//        if annotation.count != annotation.count {
//            
//            uiView.removeAnnotation(uiView.annotations as! MKAnnotation)
//            
//        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}


class Coordinator: NSObject, MKMapViewDelegate{
    var parent: MapViewApple
    
    init(_ parent: MapViewApple) {
        self.parent = parent
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        parent.centerCoordinate = mapView.centerCoordinate
    }
}

extension MKPointAnnotation {
    
    static var examples: MKPointAnnotation{
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home since 2015"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}


struct MapPreviews: PreviewProvider{
    static var previews: some View{
        MapViewApple(centerCoordinate: .constant(MKPointAnnotation.examples.coordinate), annotation: [MKPointAnnotation.examples])
    }
    

}

struct AppleContentView: View {
    
    @State private var centeroordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    
    
    var body: some View {
        
        ZStack{
                
            MapViewApple(centerCoordinate: $centeroordinate, annotation: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centeroordinate
                        self.locations.append(newLocation)
                        
                    }, label: {
                            Image(systemName: "plus")
                    })
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        
        }
        
        
    }
}

#Preview {
    AppleContentView()
        
    
}


