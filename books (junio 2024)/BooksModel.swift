@Observable class BooksModel { //modelo donde guardo mis books
    // Los datos
    private(set) var books = [BookItem]()    
    private static let url = "https://ibros.core.upm.es"
    func download()  async{
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                let books = try JSONDecoder().decode([BookItem].self, from: data)
                self.books = books
                print("Books cargados")
            } catch {
                print(error.localizedDescription)
            }
        }
}
