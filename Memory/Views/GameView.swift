//
//  GridView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var CardsViewModel: CardsViewModel
    @ObservedObject var CardCustomViewModel: CardCustomizationViewModel
}

extension GameView {
    var body: some View {
        
            GeometryReader { geometry in
                
                VStack {
                    LazyVGrid(columns: CardsViewModel.columns, spacing: 10) {
                        ForEach($CardsViewModel.cards, id: \.self) { $card in
                            
                            CardView(
                                card: card,
                                isFlipped: card.checkIfIsFlipped(),
                                onTapAction: {
                                    CardsViewModel.didTapCard(card: card)
                                },
                                faceDownColor: CardCustomViewModel.faceDownColor,
                                faceUpColor: CardCustomViewModel.faceUpColor
                            )
                                .frame(height: geometry.size.height * 0.8 / CGFloat(CardsViewModel.rowCount))
                            
                            
                        }
                        
                    }
                    Spacer()
                    Button("Restart Game")
                    {
                        CardsViewModel.clearVariablesAndRestartGame()
                    }
                    .buttonStyle(.primary)
                    
                }
                .padding()
            }
            
        
        .navigationBarTitle(
            Text("\(CardsViewModel.timeElapsed)")
        )
        .onReceive(CardsViewModel.timer) { time in
            CardsViewModel.timeElapsed += 1
        }
        .alert(isPresented: $CardsViewModel.allSymbolsAreMatched) {
            Alert(title: Text("YOU WON"), message: Text("Your score was: SCORE, and was achieved in \(CardsViewModel.timeElapsed)"), dismissButton: .default(Text("Got it!")))
        }
    }
}


