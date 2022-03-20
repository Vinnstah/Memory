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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [unowned self] in
            
            defer {
                self.idOfFirstFlippedCard = nil
                self.idOfSecondFlippedCard = nil
            }
            
            if card.representation == cardByID(idOfFirstFlippedCard).representation {
                matchedCardIDs.insert(card.id, idOfFirstFlippedCard)
                
                //Check if the win-condition is met. If it is set victory to true and stop the clock
                if checkIfAllCardsAreMatched() {
                    allSymbolsAreMatched = true
                    self.timer.upstream.connect().cancel()
                }
                
            }
        })
    }
}



extension CardsViewModel {
    
    
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
        timeElapsed = .init()
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        cards = symbols.duplicate().shuffled().map {
            symbol in Card(symbol: symbol,
                           checkIfIsFlippedByCardID: {
                [unowned self] cardID in self.checkIfCardWithIDIsFlipped(cardID) }) }
    }
}

extension CardsViewModel {
    
    func checkIfAllCardsAreMatched() -> Bool {
        if matchedCardIDs.count == cards.count {
            return true
        } else {
            return false
        }
}
    
}


