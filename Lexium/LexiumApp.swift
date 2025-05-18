
import SwiftUI

@main
struct LexiumApp: App {
    @State private var gameManager = GameManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(gameManager)
                .preferredColorScheme(.dark)
        }
    }
}
