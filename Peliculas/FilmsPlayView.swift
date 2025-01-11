import SwiftUI
struct FilmPlay: View{
    var filmItem: FilmItem
    @State var userResponse = true
    @State var showAlert = false
    var body: some View {
        VStack {
            Text("Sobre ")
                .font(.title) + 
            Text(filmItem.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            MyAsyncImage(url: filmItem.posterUrl)
                .scaledToFit()
                .clipped()
                .saturation(self.showAlert ? 0.1 : 1)
                .animation(.easeInOut, value: self.showAlert)
            Spacer()
            Text("\(filmItem.question ?? "Pregunta")?")
        }       
        HStack {
            Button{
                checkResponse(userResponse: true)
            } label:{
                Text("Sí")
                    .padding()
            }
            .buttonSyle(.bordered)
            Button{
                checkResponse(userResponse: false)
            } label:{
                Text("No")
                    .padding()
            }
            .buttonSyle(.bordered)
            }
            .font(.largeTitle)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(userResponse ? "Acertaste" : "Fallaste"))
            }
            .navigationTitle(Text("Responde:"))
        }            
    func checkResponse(userResponse: Bool){
        self.userResponse = userResponse
        showAlert = true
    }   
}


