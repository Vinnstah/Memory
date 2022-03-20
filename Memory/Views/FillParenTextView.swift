//
//  FillParenTextView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-20.
//

import SwiftUI

struct FillParentText: View {
    
    let text: Text
    
    @inlinable
    init(
        @ViewBuilder text: () -> Text
    ) {
        self.text = text()
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            text.font(.system(size: geometry.size.width - 10))
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
        }
        
    }
    
}
