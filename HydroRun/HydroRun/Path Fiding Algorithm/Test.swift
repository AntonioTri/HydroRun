//
//  Test.swift
//  HydroRun
//
//  Created by Antonio Tridente on 04/11/23.
//

import SwiftUI


// QUESTO è SOLO UN TEST PER VERIFICARE CHE LA FUNZIONE FUNZIONI
// Se si va nel file che contiene i dati dell'utente e si cambiano i valori nel
// costruttore publico, ( Il file si chiama proprio "User") relativi all'altezza
// e al peso, il valore IBM cambierà e si potrà vedere anche il valore in tempo
// reale cambiare

struct Test: View {
    
    @State private var nroFontanelle: Int = 3
    var user = User()
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                Task {
                    nroFontanelle = await RicercaNumeroFontanelle(user: user)
                }
            }
        Text ("Il numero di fontanelle scelto per te è : \(nroFontanelle)")
        
    }
}


#Preview {
    Test()
}
