import SwiftUI

struct BottoneStart: View {
    @State private var isRunning = false
    @State private var isPaused = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var showingStopConfirmation = false
    @State private var showButtons = false
    @State private var startTimerOnPlay = false // Aggiunto stato per gestire l'avvio del timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var formattedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = (Int(elapsedTime) % 3600) / 60
        let seconds = Int(elapsedTime) % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var body: some View {
        ZStack {
            if isRunning {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 45)
                    .cornerRadius(10)
                    .overlay(
                        Text(formattedTime)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    )
                    .font(.largeTitle)
                    .padding()
                    .transition(.opacity)
                    .offset(y: -330)
            }

            if showButtons {
                VStack {
                    Spacer()

                    HStack {
                        Button(action: {
                            showingStopConfirmation = true
                        }) {
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(.orange)
                                .overlay(
                                    Image(systemName: "stop.fill")
                                        .foregroundColor(.white)
                                )
                                .padding(50)
                        }

                        Button(action: {
                            isPaused.toggle()
                            if isPaused && startTimerOnPlay { // Avvia il timer quando premi "Play"
                                startTimerOnPlay = false
                                isRunning = true
                            }
                        }) {
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(.black)
                                .overlay(
                                    Image(systemName: isPaused ? "play.fill" : "pause.fill")
                                        .foregroundColor(.white)
                                )
                                .padding(50)
                        }
                    }
                }
            } else {
                Button(action: {
                    showButtons = true
                    startTimerOnPlay = true // Imposta il flag per avviare il timer quando premi "Play"
                }) {
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.black)
                        .overlay(
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                        )
                }
            }
        }
        .onReceive(timer) { _ in
            if isRunning && !isPaused {
                elapsedTime += 1
            }
        }
        .alert(isPresented: $showingStopConfirmation) {
            Alert(
                title: Text("Stop Timer"),
                message: Text("Do you want to stop the timer?"),
                primaryButton: .default(Text("Yes")) {
                    isRunning = false
                    showButtons = false
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
    }
}

struct BottoneStart_Previews: PreviewProvider {
    static var previews: some View {
        BottoneStart()
    }
}

