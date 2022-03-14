//
//  CollectionOfSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

final class CollectionOfSymbols: ObservableObject {
    
    var chosenSymbol: [Card.Symbol.Animals]
    @Published var chooseASymbol: [Card.Symbol] = []
//    @Binding var chosenSymbols: ChooseSymbols
    
  
    var collectionOfSymbols: [Card.Symbol.Animals] = Card.Symbol.Animals.allCases.map {
        Card.Symbol.Animals(rawValue: $0.display)!}
    
    init(chosenSymbols: [Card.Symbol],
         chooseASymbol: [Card.Symbol]) {
        self.chosenSymbol = collectionOfSymbols
        self.chooseASymbol = chooseASymbol
    }
}
