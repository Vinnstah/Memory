//
//  GridViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

final class CardsViewModel: ObservableObject {
    typealias LayoutOrder = Card.Symbol
    
    @Published var cardViewModels: [CardViewModel]
    var columns: [GridItem]
    
    init(columns: [GridItem],
         cardViewModels: [CardViewModel] =
         Card.Symbol.allCases.map {
        CardViewModel(card: Card(symbol: $0))}
    ) {
        self.columns = columns
        self.cardViewModels = cardViewModels
    }
    
}


extension CardsViewModel {
    
    convenience init(
        columnCount: Int = 4
    ) {
        self.init(
            
            columns: .init(
                repeating: .init(.flexible()),
                count: columnCount
            )
            , cardViewModels: .init()
            
        )
    }
}
