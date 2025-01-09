import SwiftUI

struct AsyncImage: View {
    var url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            if url == nil {
                // Si no hay URL, se muestra un color de fondo blanco
                Color.white
            } else if let image = phase.image {
                // Si la imagen se carga correctamente
                image
                    .resizable()
            } else if phase.error != nil {
                // Si ocurre un error al cargar la imagen
                Color.red
            } else {
                // Mientras la imagen se está cargando
                ProgressView()
            }
        }
    }
}
