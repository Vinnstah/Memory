//
//  CardViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation

final class CardViewModel: Identifiable, Hashable, ObservableObject {

    let card: Card
    @Published var isFlipped: Bool
    
    init(
        card: Card,
        isFlipped: Bool = false
    ){
        self.card = card
        self.isFlipped = isFlipped

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




