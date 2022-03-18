//
//  GridView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: CardsViewModel
    @ObservedObject var CardCustomViewModel: CardCustomizationViewModel
}

extension GameView {
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: viewModel.columns, spacing: 10) {
                    ForEach($viewModel.cards, id: \.self) { $card in
                        
                        CardView(
                            card: card,
                            isFlipped: card.checkIfIsFlipped(),
                            onTapAction: {
                                viewModel.didTapCard(card: card)
                            },
                            faceDownColor: CardCustomViewModel.faceDownColor,
                            faceUpColor: CardCustomViewModel.faceUpColor
                        )
                            .frame(height: geometry.size.height * 0.8 / CGFloat(viewModel.rowCount))
                        
                        
                    }
                    
                }
                Spacer()
                Button("Restart Game")
                        {
                    viewModel.clearVariablesAndRestartGame()
                        }
                        .buttonStyle(.primary)
                    
            }
            .padding()
        }
    }
}


