
@Observable class MatchesModel { //modelo donde guardo mis matches
    
    // Los datos
    @Published private(set) var matches = [MatchItem]()

    func load() {
        guard let jsonURL = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            print("Internal error: No encuentro match.json")
            return
        }
            
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let matches = try decoder.decode([MatchItem].self, from: data)
            self.matches = matches
        } catch {
            print("Error cargando datos locales: \(error)")
        }
    }

    func download() async {
        guard let url = URL(string: "http://127.0.0.1:3000/matches.json") else {
             return
        }
        
        print("Iniciando descarga: \(url).")
        
        guard let (data, _) = try? await URLSession.shared.data(from: url),
              let matches = try? JSONDecoder().decode([MatchItem].self, from: data) else {
                print("Error: recibidos datos corruptos.")
                return
              }
            
            DispatchQueue.main.async {
                self.matches = matches.shuffled()
                print("Terminada la descarga")
            } 
    }
}