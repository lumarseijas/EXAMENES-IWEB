import SwiftUI

struct MatchRow: View {
    var matchItem: MatchItem

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                // Título del partido (fase)
                Text(matchItem.phase)
                    .font(.headline)
                    .lineLimit(1)

                // Equipos participantes
                HStack {
                    HStack {
                        AsyncImage(url: matchItem.team1?.flag)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle()) // Bandera en forma de círculo
                            .shadow(radius: 5)
                        Text(matchItem.team1.name) //AQUI ES TEAM1?.NAME ?????????
                            .font(.subheadline)
                    }
                    Text("vs")
                        .foregroundColor(.secondary)
                    HStack {
                        AsyncImage(url: matchItem.team2?.flag)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle()) // Bandera en forma de círculo
                            .shadow(radius: 5)
                        Text(matchItem.team2.name) //AQUI ES TEAM2?.NAME ?????????
                            .font(.subheadline)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

