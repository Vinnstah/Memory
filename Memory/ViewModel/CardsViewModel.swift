//
//  GridViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

//import Foundation
//import SwiftUI
//
//final class CardsViewModel: ObservableObject {
//    
//    @Published var cardViewModels: [CardViewModel]
//    @Published var numberOfCardsFlipped: Int
//    var columns: [GridItem]
//    @Published var idOfFlippedCard: CardViewModel.ID?
//
//    
//    init(columns: [GridItem],
//         numberOfCardsFlipped: Int = 0,
//         cardViewModels: [CardViewModel] = Card.Symbol.allCases.duplicate().map {
//        CardViewModel(card: Card(symbol: $0))}.shuffled(),
//         idOfFlippedCard: CardViewModel.ID? = nil
//    ) {
//        self.columns = columns
//        self.cardViewModels = cardViewModels
//        self.numberOfCardsFlipped = numberOfCardsFlipped
//        self.idOfFlippedCard = idOfFlippedCard
//    }
//    
//}
//
//
//extension CardsViewModel {
//    
//    convenience init(
//        columnCount: Int = 4
//    ) {
//        self.init(
//            
//            columns: .init(
//                repeating: .init(.flexible()),
//                count: columnCount
//            )
//            
//        )
//    }
//}
//
//
