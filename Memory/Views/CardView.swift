import SwiftUI


struct CardView<FaceUp, FaceDown>: View where FaceUp: View, FaceDown: View {
    
    let isFlipped: Bool
    let onTapAction: () -> Void
    let faceUp: FaceUp
    let faceDown: FaceDown
    
    @inlinable
    init(
        isFlipped: Bool,
        onTapAction: @escaping () -> Void,
        @ViewBuilder faceUp: () -> FaceUp,
        @ViewBuilder faceDown: () -> FaceDown
    ) {
        self.isFlipped = isFlipped
        self.onTapAction = onTapAction
        self.faceUp = faceUp()
        self.faceDown = faceDown()
    }
    
    var body: some View {
        Group {
            if isFlipped {
                faceDown
            } else {
                faceUp
            }
        }.onTapGesture {
            withAnimation {
                onTapAction()
            }
        }
    }
}

extension CardView where FaceUp == Color {
    init(
        isFlipped: Bool,
        onTapAction: @escaping () -> Void,
        @ViewBuilder faceDown: () -> FaceDown
    ) {
        self.init(
            isFlipped: isFlipped,
            onTapAction: onTapAction,
            faceUp: {
                Color.teal
            },
            faceDown: faceDown
        )
    }
    
}
extension CardView where FaceUp == Color, FaceDown == EmojiView {
    init(
        card: Card,
        isFlipped: Bool,
        onTapAction: @escaping () -> Void
    ) {
        self.init(
            isFlipped: isFlipped,
            onTapAction: onTapAction,
            faceDown: {
                EmojiView(card)
            }
        )
    }
    
}

struct EmojiView: View {
    
    private let text: Text
    
    init<S>(_ string: S) where S: StringProtocol {
        self.text = Text(string)
    }
    
    var body: some View {
        FillParentText {
            text
        }
    }
}

struct FillParentText: View {
    
    let text: Text
    
    @inlinable
    init(
        @ViewBuilder text: () -> Text
    ) {
            self.text = text()
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            text.font(.system(size: geometry.size.width))
        }
        
    }
    
}

extension EmojiView {
    
    init(_ stringRepresentable: StringRepresentable) {
        self.init(stringRepresentable.representation)
    }
    
}
