//
//  Card.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct Card: Equatable {
    
    let symbol: Symbol
    
}

extension Card {
    
    enum Symbol: String, Equatable, CaseIterable {
        
        var display: String {
            rawValue
        }
        
        case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen
        
    }
}
