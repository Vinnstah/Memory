////
////  CardViewModel+isFlipped.swift
////  Memory
////
////  Created by Viktor Jansson on 2022-03-04.
////

import SwiftUI

extension CardsViewModel {
    
    func didTapCard(card: Card) {
        guard card.id != idOfFirstFlippedCard && !checkIfCardWithIDIsFlipped(card.id)  else {
            return
        }
        
        guard let idOfFirstFlippedCard = idOfFirstFlippedCard else {
            idOfFirstFlippedCard = card.id
            return
        }
        
        idOfSecondFlippedCard = card.id
        
        //After 2 cards has been flipped we'll check if they match and then after 1 second delay flip them back if there's no match.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            
            defer {
                self.idOfFirstFlippedCard = nil
                self.idOfSecondFlippedCard = nil
            }
            
            guard let idOfFirstCard = self.idOfFirstFlippedCard else {
                return
            }
            
            if self.checkForMatchingSymbols(
                of: card.symbol,
                and: self.cardByID(self.idOfFirstFlippedCard!).symbol)
            {
                self.matchedCardIDs.insert(card.id, idOfFirstCard)
                
            }
        })
    }
}

extension CardsViewModel {
    
    //Function to check if two symbols match.
    func checkForMatchingSymbols(of card1: Card.Symbol, and card2: Card.Symbol) -> Bool {
        if card1 == card2 {
            return true
        } else {
            return false
        }
    }
    
    
    //Function to check if card.id is the same as either idOfFirstFlippedCard or second.
    public func checkIfCardWithIDIsFlipped(_ cardID: Card.ID) -> Bool {
        if cardID == idOfFirstFlippedCard ||
            cardID == idOfSecondFlippedCard ||
            matchedCardIDs.contains(cardID){
            return true
        }
        else {
            return false
        }
    }
    
    //Function to return a Card from its Card ID
    func cardByID(_ cardID: Card.ID) -> Card {
        guard let card = cards.first(where: { $0.id == cardID }) else
        { fatalError("ID not amongst cards, we expect this to never happen, from where did you get this ID?") }
        return card
    }
    
}

extension CardsViewModel {
    
    func clearVariablesAndRestartGame() {
        idOfFirstFlippedCard = nil
        idOfSecondFlippedCard = nil
        matchedCardIDs = []
        
        cards = CollectionOfSymbols(chosenSymbols: .init()).chosenSymbols.duplicate().shuffled().map {
            symbol in Card(symbol: symbol,
                           checkIfIsFlippedByCardID: {
                [unowned self] cardID in self.checkIfCardWithIDIsFlipped(cardID) }) }
    }
}
