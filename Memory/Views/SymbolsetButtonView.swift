//
//  SymbolSetButtonView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-17.
//

import SwiftUI

struct SymbolsetButtonView: View {
    
    let buttonName: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 150, height: 50)
            Text(buttonName)
                .foregroundColor(.white)
        }.padding()
    }
}


