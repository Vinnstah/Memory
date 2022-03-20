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


protocol StringRepresentable {
    var representation: String { get }
}

extension StringRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var representation: String {
        rawValue
    }
}


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
      
        case mouse, dog, cat, fox, panda, rabbit, bear, hamster
       
    }

    enum Number: String, Equatable, CaseIterable, Hashable, StringRepresentable {
        case one, two, three, four, five, six, seven, eight
        
        var representation: String {
            switch self {
            case .one: return "①"
            case .two: return "②"
            case .three: return "③"
            case .four: return "④"
            case .five: return "⑤"
            case .six: return "⑥"
            case .seven: return "⑦"
            case .eight: return "⑧"
            }
        }
    }

enum Fruit: String, Equatable, CaseIterable, Hashable, StringRepresentable {
        
        var representation: String {
            switch self {
            case .apple: return "🍎"
            case .pear: return "🍐"
            case .cherry: return "🍒"
            case .blueberry: return "🫐"
            case .watermelon: return "🍉"
            case .orange: return "🍊"
            case .strawberry: return "🍓"
            case .lemon: return "🍋"
            }
        }
      
        case apple, pear, cherry, blueberry, watermelon, orange, strawberry, lemon
       
    }

enum Food: String, Equatable, CaseIterable, Hashable, StringRepresentable {
        
        var representation: String {
            switch self {
            case .croissant: return "🥐"
            case .hamburger: return "🍔"
            case .fries: return "🍟"
            case .pizza: return "🍕"
            case .steak: return "🥩"
            case .chicken: return "🍗"
            case .taco: return "🌮"
            case .hotdog: return "🌭"
            }
        }
      
        case croissant, hamburger, fries, pizza, steak, chicken, taco, hotdog
       
    }

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
