//
//  CollectionOfSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation

struct CollectionOfSymbols {
    
    var chosenSymbols: [Card.Symbol]
    var collectionOfSymbols: [Card.Symbol] = Card.Symbol.allCases.map {
        Card.Symbol(rawValue: $0.display)!}
    
    init(chosenSymbols: [Card.Symbol]) {
        self.chosenSymbols = collectionOfSymbols
    }
}
