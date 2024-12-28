//
//  QuizzesModel.swift
//  Quiz
//
//  Created by Santiago Pavón Gómez on 18/10/24.
//

import Foundation
import SwiftUI

/// Errores producidos en el modelo de los Quizzes
enum QuizModelError: LocalizedError {
    case internalError(msg: String)
    case corruptedDataError
    case unknownError
    case httpError(msg: String)

    var errorDescription: String? {
        switch self {
        case .internalError(let msg):
            return "Error interno: \(msg)"
        case .httpError(let msg):
            return "HTTP me ha sorprendido: \(msg)"
        case .corruptedDataError:
            return "Recibidos datos corruptos"
        case .unknownError:
            return "No chungo ha pasado"
       }
    }
}

@Observable class QuizModel { 
    
    // Los datos
    @Published var quiz: QuizItem? //SOLO UN QUIZ

    func download()  async{
        do {
            let url = "https:/core.dit.upm.es/api/quizzes/random?token=1234"
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw QuizModelError.httpError(msg: "error al descargar el quiz") 
            }                
            guard let quiz = try? JSONDecoder().decode(QuizItem.self, from: data)  else {
                throw QuizModelError.corruptedDataError
            }
            self.quiz = quiz
            print("Quiz cargado")
        } catch {
        print(error.localizedDescription)
        }
    }
}