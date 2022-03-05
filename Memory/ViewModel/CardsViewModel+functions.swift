//
//  CardViewModel+isFlipped.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-04.
//

import Foundation

extension CardsViewModel {
    
    // Function to check if two cards are equal
//    func checkIfTwoCardsAreEqual(_ card1: CardViewModel.ID, _ card2: CardViewModel) -> Bool {
//        guard card1.card.symbol == card2.card.symbol else {
//            return false
//        }
//        return true
//    }
    
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
        //Check if the card is already flipped
        guard alreadyFlipped(card) == false else {
            print("Already flipped")
            return
        }
        
        func checkForMatch() -> Bool {
            if idOfFlippedCard == card.id {
                cardViewModels = cardViewModels.filter() { $0 != card }
                print(cardViewModels)
                return true
            }
            return false
        }
        
        // Set idOfFlippedCard to card.id after everything else has run
        defer {
            checkForMatch()
            idOfFlippedCard = card.id

            print("defer")
            
        }
        
        // If number of flipped cards are 0 or 1, we should flip the card.
        if numberOfCardsFlipped < 2 {
            numberOfCardsFlipped += 1
            card.isFlipped.toggle()
            print("toggle ")
            
            // If
//            if idOfFlippedCard == nil {
//                idOfFlippedCard = card.id
//            }
            
//
//        } else {
//            print("Else ")
            // TODO: Does not currently work. Need to create another function to flip cards. Will consolidate into a larger function with several different smaller functions.
            
            } else {
                print("Reflip ")
                flipAllCards(cardViewModels)
                numberOfCardsFlipped = 1
                card.isFlipped.toggle()
            }
        }
    
    
    
}
