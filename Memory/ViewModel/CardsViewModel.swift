//
//  CardVM.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-06.
//

import Foundation
import SwiftUI

final class CardsViewModel: ObservableObject {
    
    @Published var idOfFirstFlippedCard: Card.ID?
    @Published var idOfSecondFlippedCard: Card.ID?
    var cards: [Card]
    let columns: [GridItem]
    var matchedCardIDs: Set<Card.ID>
    
    init(cards: [Card] = Card.Symbol.allCases.duplicate().map {
        Card(symbol: $0, isCardFaceUp: false)}.shuffled(),
         idOfFirstFlippedCard: Card.ID?,
         idOfSecondFlippedCard: Card.ID?,
         columns: [GridItem] = .init(
            repeating: .init(.flexible()),
            count: 4),
         matchedCardIDs: Set<Card.ID>
         
         
    ){
        
        self.cards = cards
        self.idOfFirstFlippedCard = idOfFirstFlippedCard
        self.idOfSecondFlippedCard = idOfSecondFlippedCard
        self.columns = columns
        self.matchedCardIDs = matchedCardIDs
        print("init")
    }
    
    deinit {
        print("deinit")
    }
    
    
}


