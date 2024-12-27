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
                .navigationTitle("Elija un libro")
            }
    }
}
