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
    
    let symbol: Symbol.Animals
    let id: ID
    
    // Function taking no argument
    let checkIfIsFlipped: () -> Bool
    
    init(
        symbol: Symbol.Animals,
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
    
    enum Symbol: Equatable, Hashable {
        
        var display: String {
            switch self {
            case .animals(let animals): return animals.display
            case .numbers(let numbers): return numbers.display
            }

        }
        
        case animals(Animals)
        case numbers(Numbers)
        //        case chosenSymbol(Animals)
        //        case chosenSymbol(Numbers)
        
//        case 1️⃣,2️⃣,3️⃣,4️⃣,5️⃣,6️⃣,7️⃣,8️⃣
//        case one, two, three, four, five, six, seven, eight
//        case 🐶,🐱,🐭,🐹,🐰,🦊,🐻,🐼
    }
    }
    


//extension Card.Symbol {
//    var display: String {
//        switch chosen:
//    case 🐶,🐱,🐭,🐹,🐰,🦊,🐻,🐼
//    }
//
//}

extension Card.Symbol {
    enum Animals: String, Equatable, CaseIterable, Hashable {
        var display: String {
            rawValue
        }

        case 🐶,🐱,🐭,🐹,🐰,🦊,🐻,🐼

    }
}

extension Card.Symbol {
    enum Numbers: String, Equatable, CaseIterable, Hashable {
        var display: String {
            rawValue
        }

        case ①,②,⓷,④,⑤,⑥,⑦,⑧,⑨
//        1️⃣,2️⃣,3️⃣,4️⃣,5️⃣,6️⃣,7️⃣,8️⃣

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
