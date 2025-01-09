import SwiftUI
struct MatchesView: View {
    @EnvironmentObject var model: MatchesModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.matches) { matchItem in
                    NavigationLink{
                        PlayView(matchItem: matchItem)
                    } label: {
                        MatchRow(matchItem: matchItem)
                    }
                }
            }
            .listSyle(.plain)
            .task {
                if model.matches.isEmpty{
                    await model.download()
                }
            }
            .navigationTitle("Partidos de la Copa")
        }
    }
}
