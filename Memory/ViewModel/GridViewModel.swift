//
//  GridViewModel.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

final class GridViewModel: ObservableObject {
    typealias LayoutOrder = Card.Symbol
    
    var columns: [GridItem]
    @Published var testLayout: [LayoutOrder]
    
    
    init(columns: [GridItem],
         testLayout: [LayoutOrder]
    ) {
        self.columns = columns
        self.testLayout = testLayout
        
    }
    
}


extension GridViewModel {
    
    var display: String {
        testLayout.description
    }
    
    convenience init(
        layoutOrder: [LayoutOrder] = GridViewModel.layoutOrder,
        columnCount: Int = 4
    ) {
        self.init(
            
            columns: .init(
                repeating: .init(.flexible()),
                count: columnCount
            ),
            testLayout: layoutOrder
            
        )
    }
}

private extension GridViewModel {
    
    static let layoutOrder: [LayoutOrder] =
    [.one, .two, .three, .four,
     .five, .six, .seven, .eight,
     .nine, .ten, .eleven, .twelve,
     .thirteen, .fourteen, .fifteen, .sixteen
     
    ]
    
}
