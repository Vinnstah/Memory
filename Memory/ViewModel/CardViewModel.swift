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
    @Published var isMatched: Bool

    
    init(
        card: Card,
        isFlipped: Bool = false,
        isMatched: Bool = false
    ){
        self.card = card
        self.isFlipped = isFlipped
        self.isMatched = isFlipped
    }
}

extension CardViewModel {
    
    static func == (lhs: CardViewModel, rhs: CardViewModel) -> Bool {
        guard lhs.id == rhs.id else {
            return false
        }
        assert(lhs.card == rhs.card)
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
