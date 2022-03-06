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
}

extension GameView {
    var body: some View {
        LazyVGrid(columns: viewModel.columns, spacing: 10) {
            ForEach($viewModel.cards, id: \.self) { $card in
                Button(
                    action: {
                        viewModel.flipCard(card: card)
                        card.isFaceUp.toggle()
                        
                    } ,
                    label: {
                        CardView(card: card)
                           
                    }
                )
            }
        }
    }
}
