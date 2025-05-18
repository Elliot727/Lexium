import SwiftUI

struct KeyboardView: View {
    @Environment(GameManager.self) private var gameManager: GameManager
    
    private let keyboardRows = [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["Z", "X", "C", "V", "B", "N", "M"]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(keyboardRows, id: \.self) { row in
                HStack(spacing: 4) {
                    if row.count == 7 {
                        Button(action: {
                            gameManager.submitGuess()
                        }) {
                            Text("Enter")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .frame(minWidth: 60, minHeight: 44)
                                .background(Color.blue.opacity(0.7))
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    }
                    
                    ForEach(row, id: \.self) { key in
                        let char = Character(key)
                        let status = gameManager.gameState.letterStatuses[char] ?? .notGuessed
                        
                        KeyboardButton(
                            letter: char,
                            status: status,
                            action: {
                                gameManager.addLetter(char)
                            }
                        )
                    }
                    
                    if row.count == 7 {
                        Button(action: {
                            gameManager.deleteLetter()
                        }) {
                            Image(systemName: "delete.left")
                                .font(.headline)
                                .frame(minWidth: 60, minHeight: 44)
                                .background(Color.red.opacity(0.7))
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
