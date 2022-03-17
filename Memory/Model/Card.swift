//
//  Card.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct Card: Hashable, Identifiable, StringRepresentable {
    
    
    
    typealias ID = UUID
    
    let symbol: StringRepresentable
    var representation: String { symbol.representation }
    let id: ID
    
    // Function taking no argument
    let checkIfIsFlipped: () -> Bool
    
    init(
        symbol: StringRepresentable,
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

//extension Card {
//    
//    enum Symbol: String, Equatable, Hashable, CaseIterable, StringRepresentable {
//        
//        case mouse = "🐭",
//             dog = "🐶",
//             cat = "🐱",
//             fox = "🦊",
//             panda = "🐼",
//             rabbit = "🐰",
//             bear = "🐻",
//             hamster = "🐹"
//        
//    }
//}

protocol StringRepresentable {
    var representation: String { get }
}

extension StringRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var representation: String {
        rawValue
    }
}


//extension Card.Symbol {
enum Animal: String, Equatable, CaseIterable, Hashable, StringRepresentable {
        
        var representation: String {
            switch self {
            case .bear: return "🐻"
            case .cat: return "🐱"
            case .dog: return "🐶"
            case .fox: return "🦊"
            case .hamster: return "🐹"
            case .mouse: return "🐭"
            case .panda: return "🐼"
            case .rabbit: return "🐰"
            }
        }
//        
        case mouse, dog, cat, fox, panda, rabbit, bear, hamster
       
        
    }
//}

//extension Card.Symbol {
    enum Number: String, Equatable, CaseIterable, Hashable, StringRepresentable {
        case one, two, three, four, five, six, seven, eight
        
        var representation: String {
            switch self {
            case .one: return "①"
            case .two: return "②"
            case .three: return "⓷"
            case .four: return "④"
            case .five: return "⑤"
            case .six: return "⑥"
            case .seven: return "⑦"
            case .eight: return "⑧"
            }
        }
    }
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
//        
//    }
//}


extension Card {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        guard lhs.id == rhs.id else {
            return false
        }
        assert(lhs.representation == rhs.representation)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
