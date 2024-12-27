import SwiftUI
@main
struct BookApp: App {
    @State var bookModel = BookModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(bookModel)
        }
    }
}
