import SwiftUI
@main
struct MatchApp: App{
    @State var model = MatchesModel()
    var body: some Scene{
        WindowGroup {
            ContentView()
                . environment (model)
        }
    }
}
