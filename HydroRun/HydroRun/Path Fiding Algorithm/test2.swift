import SwiftUI

struct ShowFontanelle: View {
    
    @State private var nroFontane: Int?
    
    var body: some View {
        if nroFontane == nil {
            Text("Loading data ...")
                .onAppear {
                    async {
                        nroFontane = await RicercaNumeroFontanelle()
                    }
                }
        } else {
            Text("\(nroFontane ?? 0)")
        }
    }
}

#Preview {
    ShowFontanelle()
}
