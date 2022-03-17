import SwiftUI


struct CardView<FaceUp, FaceDown>: View where FaceUp: View, FaceDown: View {
    
    let isFlipped: Bool
    let onTapAction: () -> Void
    let faceUp: FaceUp
    let faceDown: FaceDown
    
    //    @inlinable
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
                faceUp
            } else {
                faceDown
            }
        }.onTapGesture {
            withAnimation {
                onTapAction()
            }
        }
    }
}

extension CardView where FaceUp == AnyView, FaceDown == AnyView {
    init(
        card: Card,
        isFlipped: Bool,
        onTapAction: @escaping () -> Void
    ) {
        self.init(
            isFlipped: isFlipped,
            onTapAction: onTapAction,
            faceUp: {
                AnyView(
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).fill(Color.blue)
                            .frame(
                                width: UIScreen.screenWidth / 4 - 10,
                                height: UIScreen.screenHeight / 5 - 10
                            )
                        Text(card.symbol.display)
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                    })
            },
            faceDown: {
                AnyView(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.teal)
                            .frame(
                                width: UIScreen.screenWidth / 4 - 10,
                                height: UIScreen.screenHeight / 5 - 10
                            ))
            }
        )
    }
    
}
