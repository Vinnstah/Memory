//
//  CardViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation

final class CardViewModel: Identifiable, Hashable, ObservableObject {

    let id: UUID = .init()
    @Published var name: DisplayName
    @Published var isPressed: Bool
//    @Published var item: Card.Symbol
//    @Published var defaultLayoutOrder: [Card.Symbol] =
//    [
//        .one, .two, .three, .four,
//        .five, .six, .seven, .eight,
//        .nine, .ten, .eleven, .twelve,
//        .thirteen, .fourteen, .fifteen, .sixteen
//    ]
    
    init(
        name: DisplayName,
        isPressed: Bool = false
    ){
        self.name = name
        self.isPressed = isPressed

    }
}

extension CardViewModel {
    
    static func == (lhs: CardViewModel, rhs: CardViewModel) -> Bool {
        assert(lhs.id == rhs.id)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CardViewModel {
    
    typealias DisplayName = Card.Symbol
}




