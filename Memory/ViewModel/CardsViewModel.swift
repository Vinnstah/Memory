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



enum SymbolSet: String, Equatable, CaseIterable, Identifiable {
    case animals, numbers
    
    var symbols: [StringRepresentable] {
        switch self {
        case .animals: return Animal.allCases
        case .numbers: return Number.allCases
        }
    }
}

extension RawRepresentable where Self: Identifiable, Self.RawValue: Hashable {
    var id: RawValue { rawValue }
}
