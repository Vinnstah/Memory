//
//  Card.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct Card: Hashable, Identifiable {
    
    let id = UUID()
    let name: String
    
}

extension Card {
    
    enum Symbol: String {
        
        case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen
        
//             one = "1", two = "2", three = "3", four = "4",
//             five = "5", six = "6", seven = "7", eight = "8",
//             nine = "9", ten = "10", eleven = "11", twelve = "12",
//             thirteen = "13", fourteen = "14", fifteen = "15", sixteen = "16"
    }
}

extension Card {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        assert(lhs.id == rhs.id)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
