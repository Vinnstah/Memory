import SwiftUI


struct CardView<FaceUp, FaceDown>: View where FaceUp: View, FaceDown: View {
    
    let isFlipped: Bool
    let onTapAction: () -> Void
    let faceUp: FaceUp
    let faceDown: FaceDown
    var faceDownColor: Color = Color.blue
    var faceUpColor: Color = Color.ForestTheme().primaryColor
    
    
    @inlinable
    init(
        isFlipped: Bool,
        onTapAction: @escaping () -> Void,
        @ViewBuilder faceUp: () -> FaceUp,
        @ViewBuilder faceDown: () -> FaceDown,
        faceDownColor: Color,
        faceUpColor: Color
    ) {
        self.isFlipped = isFlipped
        self.onTapAction = onTapAction
        self.faceUp = faceUp()
        self.faceDown = faceDown()
        self.faceDownColor = faceDownColor
        self.faceUpColor = faceUpColor
    }
    
    var body: some View {
        Group {
            if isFlipped {
                faceDown
            } else {
                faceUp.cornerRadius(25)
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
        @ViewBuilder faceDown: () -> FaceDown,
        faceDownColor: Color,
        faceUpColor: Color
    ) {
        self.init(
            isFlipped: isFlipped,
            onTapAction: onTapAction,
            faceUp: {
                faceUpColor
            },
            faceDown: faceDown,
            faceDownColor: faceDownColor,
            faceUpColor: faceUpColor
            
        )
    }
    
}
extension CardView where FaceUp == Color, FaceDown == FaceDownView {
    init(
        card: Card,
        isFlipped: Bool,
        onTapAction: @escaping () -> Void,
        faceDownColor: Color,
        faceUpColor: Color
    ) {
        self.init(
            isFlipped: isFlipped,
            onTapAction: onTapAction,
            faceDown: {
                FaceDownView(card)
            },
            faceDownColor: faceDownColor,
            faceUpColor: faceUpColor
        )
    }
    
}


