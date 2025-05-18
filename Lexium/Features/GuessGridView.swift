import SwiftUI

struct GuessGridView: View {
    @Environment(GameManager.self) private var gameManager: GameManager

    var body: some View {
         VStack(spacing: 8) {
             ForEach(0..<gameManager.gameState.maxAttempts, id: \.self) { row in
                 HStack(spacing: 8) {
                     ForEach(0..<5, id: \.self) { col in
                         let guess: String? = row < gameManager.gameState.guesses.count ? gameManager.gameState.guesses[row] :
                             (row == gameManager.gameState.currentAttempt ? gameManager.gameState.currentGuess : nil)

                         let letter: Character? = {
                             guard let word = guess, col < word.count else {
                                 return nil
                             }
                             return word[word.index(word.startIndex, offsetBy: col)]
                         }()
                         
                         let status: LetterStatus = {
                             if row < gameManager.gameState.currentAttempt {
                                 return gameManager.gameState.letterStatus(at: col, in: gameManager.gameState.guesses[row])
                             } else {
                                 return .notGuessed
                             }
                         }()
                         
                         let isCurrentRow = row == gameManager.gameState.currentAttempt
                         let isCursorHere = isCurrentRow && col == gameManager.cursorPosition

                         WordCell(letter: letter, status: status)
                             .overlay(
                                 RoundedRectangle(cornerRadius: 8)
                                     .stroke(isCursorHere ? Color.blue : Color.clear, lineWidth: 2)
                             )
                             .onTapGesture {
                                 if isCurrentRow {

                                     gameManager.moveCursor(to: col)
                                 }
                             }
                     }
                 }
             }
         }
         .padding(.horizontal)
     }
 }
