import Foundation
struct BookItem: Codable, Identifiable {
    let id: Int
    let book: String
    let question: String
    let answer1: AnswerX?
    let answer2: AnswerX?
    let solution: Int
    struct AnswerX: Codable {
        let answer: String?
        let photo: URL?
    }
}