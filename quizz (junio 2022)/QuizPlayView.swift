import SwiftUI

struct QuizPlayView: View {
    @EnvironmentObject var model: QuizModel // Modelo para gestionar un solo quiz

    @State private var respuesta: String = ""
    @State private var showAlertResult: Bool = false
    @State private var resultCheckRespuesta: Bool = false
    @State private var waitingCheckRespuesta: Bool = false
    @State private var showAlertError: Bool = false
    @State private var msgError: String = ""

    var body: some View {
        VStack {
            if let quiz = model.quiz {
                cabecera(quiz)
                adjunto(quiz)
                respuestaView(quiz)
                autor(quiz)
            } else {
                Text("Cargando un quiz...")
                    .onAppear {
                        Task {
                            await model.load()
                        }
                    }
            }
        }
        .padding()
        .alert("Error", isPresented: $showAlertError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(msgError)
        }
    }

    func cabecera(_ quiz: QuizItem) -> some View {
        HStack {
            Text(quiz.question)
                .font(.largeTitle)
                .lineLimit(3)
                .padding()
        }
    }

    func adjunto(_ quiz: QuizItem) -> some View {
        let url = quiz.attachment?.url {
            return AnyView(
                EasyAsyncImage(url: url)
                    .easyRectangle()
                    .padding()
            )
        } 
    }

    func respuestaView(_ quiz: QuizItem) -> some View {
        VStack {
            TextField("Respuesta:", text: $respuesta)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    checkAnswer(quiz)
                }

            if waitingCheckRespuesta {
                ProgressView()
            } else {
                Button("Comprobar") {
                    checkAnswer(quiz)
                }
                .padding()
                .alert(resultCheckRespuesta ? "¡Correcto!" : "Incorrecto", isPresented: $showAlertResult) {
                    Button("OK", role: .cancel) {}
                }
            }
        }
    }

    func autor(_ quiz: QuizItem) -> some View {
        VStack {
            if let author = quiz.author {
                Text(author.username ?? "Anónimo")
                    .font(.subheadline)
                    .padding(.top)

                if let photoURL = author.photo?.url {
                    EasyAsyncImage(url: photoURL)
                        .frame(width: 50, height: 50)
                        .easyCircle()
                }
            } else {
                Text("Autor desconocido")
                    .font(.subheadline)
            }
        }
    }

}