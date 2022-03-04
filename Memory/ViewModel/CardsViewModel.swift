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
    var defaultLayoutOrder: [LayoutOrder] =
    [
        .one, .two, .three, .four,
        .five, .six, .seven, .eight,
        .nine, .ten, .eleven, .twelve,
        .thirteen, .fourteen, .fifteen, .sixteen
    ]
    
    
    init(columns: [GridItem],
         cardViewModels: [CardViewModel]
    ) {
        self.columns = columns
        self.cardViewModels = cardViewModels
    }
    
}


extension CardsViewModel {
    
    convenience init(
        layoutOrder: [LayoutOrder] = .init(),
        columnCount: Int = 4
    ) {
        self.init(
            
            columns: .init(
                repeating: .init(.flexible()),
                count: columnCount
            ), cardViewModels: .init()
            
        )
    }
}
