import Foundation

struct GameState {
    var targetWord: String
    var currentGuess: String = ""
    var guesses: [String] = []
    var letterStatuses: [Character: LetterStatus] = [:]
    var usedLetters: [Character] = []
    var currentAttempt: Int = 0
    var maxAttempts: Int = 6
    var gameOver: Bool = false
    var gameWon: Bool = false

    init(targetWord: String){
        self.targetWord = targetWord.uppercased()
    }
    
    func letterStatus(at index: Int, in guess: String) -> LetterStatus {
        guard index < guess.count && index < targetWord.count else {
            return .notGuessed
        }
        
        let guessIndex = guess.index(guess.startIndex, offsetBy: index)
        let guessChar = guess[guessIndex]
        let targetIndex = targetWord.index(targetWord.startIndex, offsetBy: index)
        
        if guessChar == targetWord[targetIndex] {
            return .correct
        } else if targetWord.contains(guessChar) {
            return .wrongPosition
        } else {
            return .incorrect
        }
    }
}
