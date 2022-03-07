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
        guard isCardFlippable(card) else {
            return
        }
        
        idOfFirstFlippedCard = card.id
        
        
        // TODO: Need to figure out how to mutate state for isCardFaceUp
//        card.isCardFaceUp.toggl
       
        

        
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
    
    
    func isCardFlippable(_ card: Card) -> Bool {
        !matchedCardIDs.contains(card.id) &&
        card.id != idOfSecondFlippedCard
//        || idOfSecondFlippedCard)
    }
    
}
