import SwiftUI

@main
struct MatchApp: App {
    @StateObject var matchesModel = MatchesModel() 

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MatchesView()
                    .environmentObject(matchesModel) 
            }
        }
    }
}
