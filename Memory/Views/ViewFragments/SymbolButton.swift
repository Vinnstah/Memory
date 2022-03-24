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
    @Binding var selectedButton: SymbolSet
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                selectedButton = symbolSet
            }
                   
                   , label: {
                VStack {
                    if symbolSet == selectedButton {
                    image
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center).scaleEffect(self.animate ? 1 : 1.1)
                        .foregroundColor(PrimaryButtonStyle.defaultColorTheme.primaryColor)
                        .padding()
                        .onAppear { self.animate = true }
                        .animation(animate ? Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true) : .default)
//                        .onReceive( { _ in
//                            self.animate = false
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                self.animate = true
//                            }})
                                        
                    Text("\(String(describing: symbolSet).uppercased())")
                        .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                        .padding()
                    }
                    else {
                        image
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                            .padding()
                        
                        
                        Text("\(String(describing: symbolSet).uppercased())")
                            .foregroundColor(PrimaryButtonStyle.defaultColorTheme.secondaryColor)
                            .padding()
                    }
                }
                .frame(width: 175, height: 175, alignment: .center)
            }
            )
//                .overlay(symbolSet == selectedButton ? {
//                    RoundedRectangle(cornerRadius: 16)
//                    .stroke(Color.blue, lineWidth: 4) } : {
//                        RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color.clear, lineWidth: 4) })
//                .border(symbolSet == selectedButton ? Color.ForestTheme().primaryColor : Color.clear, width: 10 ).cornerRadius(25)
            
            
        }
    }
}


