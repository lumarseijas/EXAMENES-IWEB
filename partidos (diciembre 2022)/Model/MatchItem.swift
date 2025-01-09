struct MatchItem: Codable, Identifiable {
    let id: Int
    let phase: String
    let team1: Team? //nose si aqui tiene "?"
    let team2: Team? //nose si aqui tiene "?"
    let winner: Int
    let details: String

    struct Team: Codable {
        let name: String
        let flag: URL?
    }
}