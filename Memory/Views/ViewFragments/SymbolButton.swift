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
                            .onTapGesture {
                                self.animate = true
                            }
                            .animation(animate ? Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true) : .default)
                        
                        
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
        }
    }
}


