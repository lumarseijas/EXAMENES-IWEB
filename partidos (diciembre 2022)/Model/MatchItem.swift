struct MatchItem: Codable, Identifiable {
    let id: Int
    let phase: String
    let team1: Team? // la ? es porq una de sus propiedades es opcional
    let team2: Team? 
    let winner: Int
    let details: String

    struct Team: Codable {
        let name: String
        let flag: URL?
    }
}