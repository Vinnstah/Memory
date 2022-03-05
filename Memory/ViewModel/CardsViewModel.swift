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
    
    //Comment out this section to compile
//    var firstCard: CardViewModel
//    var secondCard: CardViewModel
    
    init(columns: [GridItem],
         numberOfCardsFlipped: Int = 0,
         cardViewModels: [CardViewModel] = Card.Symbol.allCases.duplicate().map {
        CardViewModel(card: Card(symbol: $0))}
         
         //Comment out this section to compile
//         ,firstCard: CardViewModel,
//         secondCard: CardViewModel
    ) {
        self.columns = columns
        self.cardViewModels = cardViewModels
        self.numberOfCardsFlipped = numberOfCardsFlipped
        
        //Comment out this section to compile
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
            //Comment out this section to compile
//            ,firstCard: CardViewModel, secondCard: CardViewModel
            
        )
    }
}


