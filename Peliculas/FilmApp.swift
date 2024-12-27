import SwiftUI
@main
struct FilmApp: App{
    @State var model = FilmsModel()
    var body: some Scene{
        WindowGroup {
            ContentView()
                . environment (model)
        }
    }
}
