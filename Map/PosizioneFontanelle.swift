import SwiftUI
import MapKit

//In questo file troviamo la struct View che ci permette di vedere la posizione dlle fontanelle nel parco
struct MostraMappaFontane: View{
    
    var body: some View{
        
        //Si inizializza una mappa
        Map{
            //Si esegue un ForEach che parte da 0 ed arriva al size dell nostro array fontanelle
            ForEach(0..<fontane.count) { i in
                
                //Con una closure andiamo a creare annotazioni sulla mappa aggiungendo un cerchio blu per ogni posizione
                //etratta dall'array di posizione i, scriviamo inolter "fontanella" su ogni anotazione
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
        }
    }
}
