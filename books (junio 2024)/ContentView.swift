import SwiftUI
struct ContentView: View{
    @Environment(BookModel.self) var bookModel
    var body: some View{
        NavigationStack{
            List {
                ForEach(bookModel.books) {bookItem in
                    NavigationLink(destination: BookPlayView(bookItem: bookItem)){
                        BookRowView(bookItem: bookItem)
                        }
                    }
                }
                .task {
                if model.books.isEmpty{
                    await model.download()
                }
                }
                .navigationTitle("Elija un libro")
            }
    }
}
