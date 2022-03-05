//
//  CardViewModel+isFlipped.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-04.
//

import Foundation

extension CardsViewModel {
    
    // Function to check if two cards are equal
    func checkIfTwoCardsAreEqual(_ card1: CardViewModel, _ card2: CardViewModel) -> Bool {
        guard card1.card.symbol == card2.card.symbol else {
            return false
        }
        return true
    }
    
    // Functionn to flip all cards if they're not matched
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
    
    // Check if card is already flipped
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
            
            if firstCard == nil {
                firstCard = card
                
            } else {
                secondCard = card
                
            }
            
            
        } else {
            // TODO: Does not currently work. Need to create another function to flip cards. Will consolidate into a larger function with several different smaller functions.
            if checkIfTwoCardsAreEqual(firstCard!, secondCard!) {
                firstCard?.isMatched = true
                secondCard?.isMatched = true
            } else {
                flipAllCards(cardViewModels)
                numberOfCardsFlipped = 1
                card.isFlipped.toggle()
            }
        }
    }
    
}
