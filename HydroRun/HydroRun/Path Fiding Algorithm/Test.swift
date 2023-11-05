import SwiftUI

struct AnimatedButtons: View {
    @State private var moveLeftButton = false
    @State private var moveRightButton = false

    var body: some View {
        HStack {
            if moveLeftButton {
                Button(action: {
                    // Azione del pulsante sinistro
                }) {
                    Text("Left Button")
                }
                .transition(.offset(x: -200, y: 0))
            }

            Spacer()

            if moveRightButton {
                Button(action: {
                    // Azione del pulsante destro
                }) {
                    Text("Right Button")
                }
                .transition(.offset(x: 200, y: 0))
            }
        }
        .onAppear {
            withAnimation {
                moveLeftButton = true
            }

            withAnimation {
                moveRightButton = true
            }
        }
    }
}

#Preview {
    AnimatedButtons()
}


