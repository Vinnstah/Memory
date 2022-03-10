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
    @Published var symbolOfFirstFlippedCard: Card.Symbol?
    var symbols: [Card.Symbol] = Card.Symbol.allCases.map {
        Card.Symbol(rawValue: $0.display) ?? .one}
    
    lazy var cards: [Card] = {
        
        symbols.duplicate().shuffled().map {
            symbol in Card(symbol: symbol,
                           checkIfIsFlippedByCardID: {
                [unowned self] cardID in self.checkIfCardWithIDIsFlipped(cardID) }) } }()
    
    let columns: [GridItem]
    var matchedCardIDs: Set<Card.ID>
    
    
    init(
        idOfFirstFlippedCard: Card.ID? = nil,
        idOfSecondFlippedCard: Card.ID? = nil,
        symbolOfFirstFlippedCard: Card.Symbol? = nil,
        columns: [GridItem] = .init(
            repeating: .init(.flexible()),
            count: 4),
        matchedCardIDs: Set<Card.ID>
        
        
    ){

        self.idOfFirstFlippedCard = idOfFirstFlippedCard
        self.idOfSecondFlippedCard = idOfSecondFlippedCard
        self.symbolOfFirstFlippedCard = symbolOfFirstFlippedCard
        self.columns = columns
        self.matchedCardIDs = matchedCardIDs
        
    }
    
    deinit {
        print("deinit")
    }
    
    
}


