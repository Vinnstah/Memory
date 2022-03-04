//
//  GridViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

final class CardsViewModel: ObservableObject {
    
    @Published var cardViewModels: [CardViewModel]
    @Published var numberOfCardsFlipped: Int
    var columns: [GridItem]
    
    //Need to implement these as optional
//    var firstCard: Card
//    var secondCard: Card
    
    init(columns: [GridItem],
         numberOfCardsFlipped: Int = 0,
         cardViewModels: [CardViewModel] = Card.Symbol.allCases.map {
        CardViewModel(card: Card(symbol: $0))}.shuffled()
//         ,firstCard: Card,
//         secondCard: Card
    ) {
        self.columns = columns
        self.cardViewModels = cardViewModels
        self.numberOfCardsFlipped = numberOfCardsFlipped
//        self.firstCard = firstCard
//        self.secondCard = secondCard
    }
    
}


extension CardsViewModel {
    
    convenience init(
        columnCount: Int = 4
    ) {
        self.init(
            
            columns: .init(
                repeating: .init(.flexible()),
                count: columnCount
            )
//            ,firstCard: Card,
//            secondCard: "
            
        )
    }
}
