import Foundation

protocol WordRepositoryProtocol {
    func getRandomWord() -> String
    func isValidWord(_ word: String) -> Bool
}
