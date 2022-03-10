////
////  CardViewModel+isFlipped.swift
////  Memory
////
////  Created by Viktor Jansson on 2022-03-04.
////

import SwiftUI

extension CardsViewModel {
    
    func didTapCard(card: Card) {
        // TODO: clean up functions
        guard card.id != idOfFirstFlippedCard else {
            return ()
        }
        
        if idOfFirstFlippedCard == nil {
            idOfFirstFlippedCard = card.id
            symbolOfFirstFlippedCard = card.symbol
            return
        }
        
        else {
            idOfSecondFlippedCard = card.id
            
        }
        
        //Currently bugged for first click, will alway run when you click the first card.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            if self.checkForMatchingSymbols(
                of: card.symbol,
                and: self.symbolOfFirstFlippedCard ?? .eight)
            {
                self.matchedCardIDs.insert(card.id)
                self.matchedCardIDs.insert(self.idOfFirstFlippedCard ?? card.id)
                print("Matched card ID: \(self.matchedCardIDs)")
                
            }
            print("Matched card ID: \(self.matchedCardIDs)")
            
            self.idOfFirstFlippedCard = nil
            self.idOfSecondFlippedCard = nil
        })
        
    }
    
    func checkForMatchingSymbols(of card1: Card.Symbol, and card2: Card.Symbol) -> Bool {
        //        precondition(card1 != card2)
        if card1 == card2 {
            return true } else {
                return false
            }
    }
    
    
    //Function to check if card.id is the same as either idOfFirstFlippedCard or second.
    func checkIfCardWithIDIsFlipped(_ cardID: Card.ID) -> Bool {
        if cardID == idOfFirstFlippedCard || cardID == idOfSecondFlippedCard || matchedCardIDs.contains(cardID){ return true }
        else { return false }
    }
    
}
