//
//  QuizItem.swift

import Foundation

struct QuizItem: Codable, Identifiable {
    let id: Int
    let question: String
    let author: Author?
    let attachment: URL?

    struct Author: Codable {
        let username: String
        let photo: URL?
    }
}
