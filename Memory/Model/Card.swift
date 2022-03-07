//
//  Card.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct Card: Equatable, Identifiable, Hashable {
    
    let symbol: Symbol
    let id = UUID()
    var isCardFaceUp: Bool
    
}

extension Card {
    
    enum Symbol: String, Equatable, CaseIterable {
        
        var display: String {
            rawValue
        }
        
        case one, two, three, four, five, six, seven, eight
        
    }
}

extension Card {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        guard lhs.id == rhs.id else {
            return false
        }
        assert(lhs.symbol == rhs.symbol)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
