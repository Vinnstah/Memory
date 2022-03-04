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
    
    init(columns: [GridItem],
         numberOfCardsFlipped: Int = 0,
         
         cardViewModels: [CardViewModel]
         =
         Card.Symbol.allCases.map {
        CardViewModel(card: Card(symbol: $0))}.shuffled()
    ) {
        self.columns = columns
        self.cardViewModels = cardViewModels
        self.numberOfCardsFlipped = numberOfCardsFlipped

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
//            , cardViewModels: .init()
            
        )
    }
}
