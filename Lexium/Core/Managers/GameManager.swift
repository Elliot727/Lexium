import Foundation

@Observable
class GameManager {
    var gameState: GameState
    var showError = false
    var errorMessage = ""
    var showWinAlert = false
    var showLoseAlert = false
    var cursorPosition: Int = 0
    
    private let wordRepository: WordRepositoryProtocol
    
    init(wordRepository: WordRepositoryProtocol = WordRepository()) {
        self.wordRepository = wordRepository
        self.gameState = GameState(targetWord: wordRepository.getRandomWord())
    }
    
    func addLetter(_ letter: Character) {
        guard !gameState.gameOver, gameState.currentGuess.count < 5 else { return }
        
        var currentGuess = gameState.currentGuess
        
        if cursorPosition < currentGuess.count {
            let index = currentGuess.index(currentGuess.startIndex, offsetBy: cursorPosition)
            

            currentGuess.insert(letter, at: index)
            

        } else {
            currentGuess.append(letter)
        }
        
        gameState.currentGuess = currentGuess
        
        cursorPosition += 1
    }
    
    func deleteLetter() {
        guard !gameState.gameOver, !gameState.currentGuess.isEmpty else { return }
        
        var currentGuess = gameState.currentGuess
        
        currentGuess.removeLast()
        gameState.currentGuess = currentGuess
        cursorPosition = currentGuess.count
    }
    
    func moveCursor(to position: Int) {
        guard !gameState.gameOver, position >= 0 else { return }
        cursorPosition = position

    }
    
    func submitGuess() {
        guard !gameState.gameOver else { return }
        
        if gameState.currentGuess.count != 5 {
            showError = true
            errorMessage = "Word must be 5 letters"
            return
        }
        
        let guess = gameState.currentGuess.uppercased()
        
        if !wordRepository.isValidWord(guess) {
            showError = true
            errorMessage = "Not a valid word"
            return
        }

        var newState = gameState
        newState.guesses.append(guess)
        newState.currentAttempt += 1
        
        for letter in guess {
            var status: LetterStatus = .incorrect
            if newState.targetWord.contains(letter) {
                status = .wrongPosition
                
                for (index, char) in guess.enumerated() {
                    if char == letter && char == newState.targetWord[newState.targetWord.index(newState.targetWord.startIndex, offsetBy: index)] {
                        status = .correct
                        break
                    }
                }
            }
            
            if newState.letterStatuses[letter] != .correct {
                newState.letterStatuses[letter] = status
            }
            
            if !newState.usedLetters.contains(letter) {
                newState.usedLetters.append(letter)
            }
        }
        
        if guess == newState.targetWord {
            newState.gameOver = true
            newState.gameWon = true
            showWinAlert = true
        } else if newState.currentAttempt >= newState.maxAttempts {
            newState.gameOver = true
            showLoseAlert = true
        }
        
        newState.currentGuess = ""
        
        gameState = newState
    }
    
    
    func resetGame() {
        gameState = GameState(targetWord: wordRepository.getRandomWord())
        showWinAlert = false
        showLoseAlert = false
    }
    
    func showNotification(message: String) {
        print(message)
    }
}
