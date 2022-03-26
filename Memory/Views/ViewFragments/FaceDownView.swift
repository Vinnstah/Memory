//
//  FaceDownView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-20.
//

import SwiftUI

struct FaceDownView: View {
    
    private let text: Text
    
    init<S>(_ string: S) where S: StringProtocol {
        self.text = Text(string)
        
    }
    
    
    var body: some View {
        
        FillParentText {
            text
        }
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.teal, lineWidth: 5)
        )
        
    }
}

extension FaceDownView {
    
    init(_ stringRepresentable: StringRepresentable) {
        self.init(stringRepresentable.representation)
    }
    
}
