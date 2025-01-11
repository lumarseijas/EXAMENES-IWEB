@Observable class MatchesModel2 { 
    
    // Los datos
    @Published private(set) var matches = [MatchItem]()
    @Published var rightResponse: Bool? // Indica si la respuesta fue correcta o no

    func load() {
        //igual que antes
    }

    func download() async {
        //igual que antes
    }

    func check(matchId: Int, winner: Int) async {
        guard let url = URL(string: "https://sitios.es/check?id=\(matchId)&winner=\(winner)") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(CheckResponse.self, from: data)
            rightResponse = response.result
        } catch {
            print("Error al realizar la petición: \(error)")
        }
    }

    struct CheckResponse: Decodable {
        let id: Int
        let result: Bool
    }
}
