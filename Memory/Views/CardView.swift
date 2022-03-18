import SwiftUI


struct CardView<FaceUp, FaceDown>: View where FaceUp: View, FaceDown: View {
    
    let isFlipped: Bool
    let onTapAction: () -> Void
    let faceUp: FaceUp
    let faceDown: FaceDown
    var faceDownColor: Color = Color.blue
    var faceUpColor: Color = Color.teal
    
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

struct FaceDownView: View {
    
    private let text: Text
    
    init<S>(_ string: S) where S: StringProtocol {
        self.text = Text(string)
        
    }
    
    
    var body: some View {
        
        FillParentText {
            
            text
        }
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.teal, lineWidth: 5)
        )
        
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
            text.font(.system(size: geometry.size.width - 10))
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
        
    }
    
}

extension FaceDownView {
    
    init(_ stringRepresentable: StringRepresentable) {
        self.init(stringRepresentable.representation)
    }
    
}
