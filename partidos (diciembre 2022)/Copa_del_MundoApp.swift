import SwiftUI
@main
struct Copa_del_MundoApp: App{
    @State var model = MatchesModel()
    var body: some Scene{
        WindowGroup {
            ContentView()
                . environment (model)
        }
    }
}