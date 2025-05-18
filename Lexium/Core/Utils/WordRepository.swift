import Foundation

class WordRepository: WordRepositoryProtocol {
    private var words: [String] = []

    init() {
        loadWords()
    }

    private func loadWords() {
        guard let url = Bundle.main.url(forResource: "words", withExtension: "json") else {
            print("Failed to find words.json")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any],
               let wordArray = dictionary["words"] as? [String] {
                words = wordArray
            } else {
                print("Failed to parse words.json")
            }
        } catch {
            print("Failed to load words.json: \(error)")
        }
    }

    func getRandomWord() -> String {
        return words.randomElement() ?? ""
    }

    func isValidWord(_ word: String) -> Bool {
        return words.contains(word.lowercased())
    }
}
