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
    @State var test: [Card.Symbol] = []
}

extension GameView {
    var body: some View {
        VStack {
        LazyVGrid(columns: viewModel.columns, spacing: 10) {
            ForEach($viewModel.cards, id: \.self) { $card in
                
                CardView(card: card, isFlipped: card.checkIfIsFlipped())
                
                    .onTapGesture {
                        viewModel.didTapCard(card: card)
                    }
                   
            }
            
        }
            RestartGame()
                .onTapGesture {
                    viewModel.clearVariablesAndRestartGame()
                }
            ChooseSymbols(symbolTypes: .init(), test: $test)
    }
    }
}
