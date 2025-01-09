@Observable class FilmsModel { //modelo donde guardo mis films
    // Los datos
    private(set) var films = [FilmItem]()    
    
    func load() {
        guard let jsonURL = Bundle.main.url(forResource: "films", withExtension: "json") else {
            print("Internal error")
            return
        }
            
        do {
            let data = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let films = try decoder.decode([FilmItem].self, from: data)
            self.films = films
            print("Películas cargadas")
        } catch {
            print("Error cargando datos locales: \(error)")
        }
    }

    func download()  async {
        guard let url = URL(string:
        "https://bequiet.dit.upm.es/geo2023/questions.json") else {
            return
        }
        print("Iniciando descarga: \(url).")

        guard let (data, _) = try? await URLSession.shared.data(from: url),
            let questions = try? JSONDecoder().decode([QuestionItem].self, from: data) else {
                print("Error: recibidos datos corruptos.")
                return
            }
            
            DispatchQueue.main.async {
                self.questions = questions.shuffled()
                print("Terminada la descarga")
            } 
    }
}