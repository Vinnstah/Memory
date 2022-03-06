//
//  CardVM.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-06.
//

import Foundation
import SwiftUI

final class CardsViewModel: ObservableObject {
    
    @Published var flippedCardID: Card.ID?
    var cards: [Card]
    let columns: [GridItem]
    var matchedCardIDs: Set<Card.ID>
    var isFaceUp: Bool
    
    init(cards: [Card] = Card.Symbol.allCases.duplicate().map {
        Card(symbol: $0)}.shuffled(),
         flippedCardID: Card.ID?,
         columns: [GridItem] = .init(
            repeating: .init(.flexible()),
            count: 4),
         matchedCardIDs: Set<Card.ID>,
         isFaceUp: Bool = false
         
         
    ){
        
        self.cards = cards
        self.flippedCardID = flippedCardID
        self.columns = columns
        self.matchedCardIDs = matchedCardIDs
        self.isFaceUp = isFaceUp
        print("init")
    }
    
    deinit {
        print("deinit")
    }
    
    
}


