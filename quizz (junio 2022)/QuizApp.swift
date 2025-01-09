import SwiftUI

@main
struct QuizApp: App {
    @State var model = QuizModel()

    var body: some Scene {
        WindowGroup {
            QuizPlayView()
                .environment(model)
        }
    }
}



