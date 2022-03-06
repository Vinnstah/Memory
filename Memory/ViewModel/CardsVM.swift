//
//  CardVM.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-06.
//

import Foundation
import SwiftUI

final class CardVM: ObservableObject {
    
    @Published var flippedCardID: Card.ID?
    var cards: [Card]
    let columns: [GridItem]
    var matchedCardIDs: Set<Card.ID>
    
    init(cards: [Card] = Card.Symbol.allCases.duplicate().map {
        Card(symbol: $0)},
         flippedCardID: Card.ID?,
         columns: [GridItem] = .init(
            repeating: .init(.flexible()),
            count: 4),
         matchedCardIDs: Set<Card.ID>
         
    ){
        
        self.cards = cards
        self.flippedCardID = flippedCardID
        self.columns = columns
        self.matchedCardIDs = matchedCardIDs
    }
    
    
}


