import SwiftUI

struct ContentView: View {
    @Environment(GameManager.self) private var gameManager: GameManager

    var body: some View {
        @Bindable var gameManager = gameManager
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.05, green: 0.05, blue: 0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    Text("Attempts: \(gameManager.gameState.currentAttempt) / \(gameManager.gameState.maxAttempts)")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        gameManager.resetGame()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                GuessGridView()
                
                Spacer()
                
                KeyboardView()
                    .padding(.bottom, 20)
            }
            
            if gameManager.showError {
                VStack {
                    
                    Text(gameManager.errorMessage)
                        .font(.headline)
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        gameManager.showError = false
                    }
                }
            }
        }
        .alert("You Won! 🎉", isPresented: $gameManager.showWinAlert) {
            Button("New Game", action: { gameManager.resetGame() })
        } message: {
            Text("Congratulations! You guessed the word in \(gameManager.gameState.currentAttempt) attempts.")
        }
        .alert("Game Over", isPresented: $gameManager.showLoseAlert) {
            Button("New Game", action: { gameManager.resetGame() })
        } message: {
            Text("The word was: \(gameManager.gameState.targetWord)")
        }
    }
}

