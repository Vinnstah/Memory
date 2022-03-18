//
//  CardVM.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-06.
//

import Foundation
import SwiftUI

final class CardsViewModel: ObservableObject {
    
    @Published var idOfFirstFlippedCard: Card.ID? = nil
    @Published var idOfSecondFlippedCard: Card.ID? = nil
    let columns: [GridItem]
    var matchedCardIDs: Set<Card.ID> = []
    var symbols: [StringRepresentable]
    
    lazy var cards: [Card] = symbols.duplicate().shuffled().map {
        symbol in Card(symbol: symbol,
                       checkIfIsFlippedByCardID: {
            [unowned self] cardID in self.checkIfCardWithIDIsFlipped(cardID) }) }
    
    init(
        columns: [GridItem] = .init(
            repeating: .init(.flexible()),
            count: 4),
        symbolSet: SymbolSet = .numbers
        
    ){
        self.columns = columns
        self.symbols = symbolSet.symbols
    }
    
}





extension RawRepresentable where Self: Identifiable, Self.RawValue: Hashable {
    var id: RawValue { rawValue }
}

extension CardsViewModel {
    
    var rowCount: Int {
        cards.count / columns.count
    }
    
}
