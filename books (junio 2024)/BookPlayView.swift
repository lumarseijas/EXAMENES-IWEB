//

import SwiftUI
struct BookPlayView: View{
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    var bookItem: BookItem
    var body : some View {
        VStack(alignment: .center) {
            //nombre libro
            Text(bookItem.book)
                .font(.largeTitle)
            //pregunta
            Text(bookItem.question)
                .font(.title2)
            //respuestas
            respuesta1
            respuesta2
            }
        .padding()
        .navigationTitle("Responde sobre") //titulo de la pantalla
        .alert(alertMessage, isPresented: $showAlert){
            Button("OK", role: .cancel)
        }   
    }
    var respuesta1: some View{
        //es la imagen con dos botones de respuestas al lado
        VStack{
            HStack{
                AsyncImage(url: bookItem.answer1?photo){ phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        ProgressView()
                    }
                }
                Button(bookItem.answer1?.answer ?? "Respuesta 1"){
                    checkAnswer(selected: 1)
                    }
            }
        .padding()    
        }
    }
    var respuesta2: some View{
        VStack{
            HStack{
                AsyncImage(url: bookItem.answer2?photo){ phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        ProgressView()
                    }
                }
                Button(bookItem.answer2?.answer ?? "Respuesta 2"){
                    checkAnswer(selected: 2)
                    }
            }
        .padding()    
        }
    }
    func checkAnswer(){
        if selected == bookItem.solution {
            alertMessage = "Acertado!"
        } else {
            alertMessage = "Fallado!"
        }
        showAlert = true
    }
}
    