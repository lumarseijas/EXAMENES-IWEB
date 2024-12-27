
//NO TENGO EL ENUNCIADO
/* ENUNCIADO QUE SUPONGO QUE ES:
Implemente un model llamado BookModel que permita gestionar las preguntas
y respuestas del juego sobre libros. El modelo debe cumplir las siguientes
especificaciones:
1) Debe ser una clase conforme al protocolo Observable para que pueda 
integrarse con SwiftUI.
2) Debe contenter una propiedad que almacene un array de objetos, BookItem,
que será utilizada por las vistas de la app para mostrar la lista de libros
y preguntas
3) Debe incluir un método llamado download que permita descargar las 
preguntas desde un servidor remoto. este metodo debe:
-Realizar una petición HTTP GET a la URL https://ibros.core.upm.es 
para obtener un JSON con las preguntas.
-Decodificar el JSON recibido en un array de objetos BookItem.
-Actualizar la propiedad publicada con los datos descargados
4) Manejar errores si ocurre un fallo
*/

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
