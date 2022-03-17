//
//  Card.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct Card: Hashable, Identifiable {
    typealias ID = UUID
    
    let symbol: Symbol
    let id: ID
    
    // Function taking no argument
    let checkIfIsFlipped: () -> Bool
    
    init(
        symbol: Symbol,
        checkIfIsFlippedByCardID: @escaping (Card.ID) -> Bool
    ) {
        self.symbol = symbol
        let id = ID()
        
        // We sent in a closure with signature `(Card.ID) -> Bool`,
        // but we store a closure with signature `() -> Bool`, because
        // here, inside this instance of `Card` we know its ID! And it
        /// would be really awkward and weird if we had to send the ID
        // a card we are askig if it is flipped to the card itself... it
        // should know its own ID!
        self.checkIfIsFlipped = {
            checkIfIsFlippedByCardID(id)
        }
        
        self.id = id
    }
}

extension Card {
    
    enum Symbol: String, Equatable, Hashable, CaseIterable {
        
        case mouse = "🐭",
             dog = "🐶",
             cat = "🐱",
             fox = "🦊",
             panda = "🐼",
             rabbit = "🐰",
             bear = "🐻",
             hamster = "🐹"
        
        
        var display: String {
            rawValue
        }
        
    }
}


//extension Card.Symbol {
//    enum Animals: String, Equatable, CaseIterable, Hashable {
//        
//        var display: String {
//            switch self {
//            case .bear: return "🐻"
//            case .cat: return "🐱"
//            case .dog: return "🐶"
//            case .fox: return "🦊"
//            case .hamster: return "🐹"
//            case .mouse: return "🐭"
//            case .panda: return "🐼"
//            case .rabbit: return "🐰"
//            }
//        }
//        
//        case mouse, dog, cat, fox, panda, rabbit, bear, hamster
//       
//        
//    }
//}

//extension Card.Symbol {
//    enum Numbers: String, Equatable, CaseIterable, Hashable {
//        
//        var display: String {
//            switch self {
//            case .one: return "①"
//            case .two: return "②"
//            case .three: return "⓷"
//            case .four: return "④"
//            case .five: return "⑤"
//            case .six: return "⑥"
//            case .seven: return "⑦"
//            case .eight: return "⑧"
//            }
//        }
//        
//        var description: Card.Symbol {
//            switch self {
//            case .one: return .numbers(.one)
//            case .two: return .numbers(.two)
//            case .three: return .numbers(.three)
//            case .four: return .numbers(.four)
//            case .five: return .numbers(.five)
//            case .six: return .numbers(.six)
//            case .seven: return .numbers(.seven)
//            case .eight: return .numbers(.eight)
//            }
//        }
//        
//        case one, two, three, four, five, six, seven, eight
//        
//    }
//}


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
