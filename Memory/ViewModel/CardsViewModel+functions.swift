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
    
    func flipCard(card: Card) {
//        flippedCardID == card.id &&
        guard isCardFlippable(card) else {
            return
        }
        
        flippedCardID = card.id

        
    }
    
    func checkIfTwoCardsAreEqual(_ card1: Card, _ card2: Card) -> Bool {
        guard card1.symbol.display == card2.symbol.display else {
            return false
        }
        return card1.id == card2.id
        
    }
    
    func checkIfCardIsFlippedOrMatched(_ card: Card) -> Bool {
        guard card.id == flippedCardID && !matchedCardIDs.contains(card.id) else {
            return false
        }
        
        return true
        
    }
    
    
    func isCardFlippable(_ card: Card) -> Bool {
//        card.id != flippedCardID && 
        !matchedCardIDs.contains(card.id)
    }
    
}
