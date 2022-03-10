////
////  CardViewModel+isFlipped.swift
////  Memory
////
////  Created by Viktor Jansson on 2022-03-04.
////
//
//import Foundation
import SwiftUI

extension CardsViewModel {
    
    func didTapCard(card: Card) {
        // TODO: FIX THIS FUNCTION. Not developed yet and not working.
        guard card.id == idOfFirstFlippedCard else {
            return
        }

        idOfFirstFlippedCard = card.id
        
        
        
    }
    
    func checkForMatchingSymbols(of card1: Card, and card2: Card) -> Bool {
        precondition(card1 != card2)
        return card1.symbol == card2.symbol
        
    }
    
    func checkIfCardIsFlippedOrMatched(_ card: Card) -> Bool {
        guard card.id == idOfSecondFlippedCard && !matchedCardIDs.contains(card.id) else {
            return false
        }
        
        return true
        
    }
    
    func checkIfCardWithIDIsFlipped(_ cardID: Card.ID) -> Bool {
        print(cards)
        return cardID == idOfFirstFlippedCard
        
    }
    
    
    func isCardFlippable(_ card: Card) -> Bool {
        !matchedCardIDs.contains(card.id) &&
        card.id != idOfSecondFlippedCard

    }
    
}
