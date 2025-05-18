import SwiftUI

struct KeyboardButton: View {
    let letter: Character
    let status: LetterStatus
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(String(letter))
                .font(.headline)
                .frame(minWidth: 30, minHeight: 44)
                .background(backgroundColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
    
    private var backgroundColor: Color {

        
        switch status {
        case .correct:
            return Color.green.opacity(0.8)
        case .wrongPosition:
            return Color.orange.opacity(0.8)
        case .incorrect:
            return Color.gray.opacity(0.5)
        case .notGuessed:
            return Color.gray.opacity(0.3)
        }
    }
}
