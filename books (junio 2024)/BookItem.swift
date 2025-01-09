import Foundation
struct BookItem: Codable, Identifiable {
    let id: Int
    let book: String
    let question: String
    let answer1: Answer?
    let answer2: Answer?
    let solution: Int
    struct Answer: Codable {
        let answer: String?
        let photo: URL?
    }
}