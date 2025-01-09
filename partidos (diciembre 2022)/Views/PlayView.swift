import SwiftUI
struct PlayView: View {
    @State var showAlert: Bool = false
    @State var isCorrect: Bool? = nil // Indica si la respuesta fue correcta o no
    var matchItem: MatchItem

    var body: some View {
        VStack(alignment: .center) {
            // Título del partido
            Text(matchItem.phase)
                .font(.largeTitle)
                .padding()
            // Equipos
            Text("\(matchItem.team1.name) vs \(matchItem.team2.name)") 
                .font(.title2)
                .padding(.bottom, 20)
            // Posibles ganadores:
            equipo1
            equipo2
        }
        .padding()
        .navigationTitle("Adivina el ganador") // Título de la pantalla
        .alert(isCorrect == true ? "¡Acertado!" : "¡Fallado!", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } 
    }

    var equipo1: some View {
        HStack {
            AsyncImage(url: matchItem.team1?.flag) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }
            Button(matchItem.team1.name) { //AQUI ES TEAM1?.NAME ?????????
                checkAnswer(selected: 1)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    var equipo2: some View {
        HStack {
            AsyncImage(url: matchItem.team2?.flag) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }
            Button(matchItem.team2.name) { //AQUI ES TEAM2?.NAME ?????????
                checkAnswer(selected: 2)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    func checkAnswer(selected: Int) {
        isCorrect = (selected == matchItem.winner)
        showAlert = true
    }
}