//
//  SymbolButton.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import SwiftUI

struct SymbolButton: View {
    
    let image: Image
    let symbolSet: SymbolSet
//    @Binding var symbolSet: SymbolSet
    
    var body: some View {
        VStack {
            Button(action: {
                
            }
                    
                    , label: {
                image
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                
                    
                    Text("\(String(describing: symbolSet).uppercased())")
                    .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
            })
            

                
        }
    }
}


