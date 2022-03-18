//
//  SymbolSet.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-18.
//

import Foundation
import SwiftUI

enum SymbolSet: String, Equatable, CaseIterable, Identifiable, Hashable {
    case animals, numbers, fruits
    
    var symbols: [StringRepresentable] {
        switch self {
        case .animals: return Animal.allCases
        case .numbers: return Number.allCases
        case .fruits: return Fruit.allCases
        }
    }
}

extension SymbolSet {
    var image: Image {
        switch self {
        case .numbers: return Image(systemName: "number.square")
        case .animals: return Image(systemName: "hare")
        case .fruits: return Image(systemName: "leaf")
        }
    }
}

//extension SymbolSet {
//    var symbolThemeColor: Color {
//        switch self {
//        case .numbers: return Color(.bluePastel)
//        case .animals: return "greenPastel"
//        case .fruits: return "liliacPastel"
//        }
//    }
//}
