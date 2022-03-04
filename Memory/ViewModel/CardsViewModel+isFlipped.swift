//
//  CardViewModel+isFlipped.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-04.
//

import Foundation

extension CardsViewModel {
    
    func checkIfTwoCardsAreEqual(_ card1: Card, _ card2: Card) -> Bool {
        guard card1.symbol == card2.symbol else {
            return false
        }
        return card1 == card2
    }
    

    func flipAllCards(_ card: [CardViewModel]) -> [CardViewModel]{
        for i in card {
            i.isFlipped = false
        }
        return card
    }
    
    func flipCard(_ card: CardViewModel){
    
        if numberOfCardsFlipped < 2 {
            card.isFlipped.toggle()
            numberOfCardsFlipped += 1

        } else {
            flipAllCards(cardViewModels)
            card.isFlipped.toggle()
            numberOfCardsFlipped = 0
            
            
            }
    }
}
