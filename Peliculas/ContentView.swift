import SwiftUI
struct ContentView: View {
    @Environment(FilmsModel.self) var model: FilmsModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.films) { item in
                    NavigationLink {
                        FilmPlay(filmItem: item)
                    } label: {
                        FilmRow(filmItem: item)
                    }
                }
            }
            .navigationTitle("Elija una película")
        }
    }
}
