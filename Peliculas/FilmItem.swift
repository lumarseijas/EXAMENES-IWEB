import Foundation
struct FilmItem: Codable, Identifiable {
    let id: Int
    let title: String
    let posterUrl: URL?
    let question: String
    let answer: Bool
}