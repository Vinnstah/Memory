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
    
    
    func flipAllCards(_ cards: [CardViewModel]) -> [CardViewModel]{
        for card in cards {
            if card.isMatched == false {
                card.isFlipped = false
            } else {
                continue
            }
        }
        return cards
    }
    
    func alreadyFlipped(_ card: CardViewModel) -> Bool {
        card.isFlipped ? true : false
    }
    
    func flipCard(_ card: CardViewModel){
        guard alreadyFlipped(card) == false else {
            return
        }
        
        if numberOfCardsFlipped < 2 {
            numberOfCardsFlipped += 1
            card.isFlipped.toggle()
            
            
        } else {
            // TODO: Implement check if two cards are equal here? Using function from above.
            flipAllCards(cardViewModels)
            numberOfCardsFlipped = 1
            
            card.isFlipped.toggle()
            
        }
    }
    
}
