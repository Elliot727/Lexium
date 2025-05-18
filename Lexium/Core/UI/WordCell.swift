import SwiftUI

struct WordCell: View {
    let letter: Character?
    let status: LetterStatus
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
                .frame(width: 50, height: 50)
            
            Text(letter.map(String.init) ?? "")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke( Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
    
    private var backgroundColor: Color {
        switch status {
        case .correct:
            return Color.green.opacity(0.8)
        case .wrongPosition:
            return Color.orange.opacity(0.8)
        case .incorrect:
            return Color.gray.opacity(0.3)
        case .notGuessed:
            return Color.gray.opacity(0.1)
        }
    }
}
