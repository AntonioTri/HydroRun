import SwiftUI

struct Prova: View {
    @State private var result: String = "Loading..." // Valore di default
    @State private var isFetching = false // Flag per gestire la visualizzazione del caricamento
    @State var user = User.shared
    

    var body: some View {
        VStack {
            Text("Risultato:")
            Text(result)
                .foregroundColor(isFetching ? .gray : .black) // Cambia il colore del testo durante il caricamento

            Button("Esegui Operazione Asincrona") {
               
//                isFetching = true // Imposta il flag di caricamento su true
//                user.nickname = "Ciao"
//                user.height = 160
//                user.fitnessLevel = 0
//                user.weight = 200
//                user.age = 22
                
                Task {
                    let asyncResult = await String(RicercaNumeroFontanelle())
                    result = asyncResult // Aggiorna il risultato quando l'operazione asincrona è completata
                    isFetching = false // Imposta il flag di caricamento su false quando è pronto
                }
            }
            .disabled(isFetching) // Disabilita il pulsante durante il caricamento
        }
    }
}

#Preview {
    Prova()
}
