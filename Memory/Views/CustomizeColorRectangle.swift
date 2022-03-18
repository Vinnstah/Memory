//
//  SymbolSetButtonView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-17.
//
//
import SwiftUI

struct CustomizeColorRectangle: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 50, height: 100)
                .chooseColor(color)
            Text(text)
                .foregroundColor(.black)
        }.padding()
    }
}

// MARK: WIP
extension View {
    func chooseColor(_ color: Color) -> Color {
        
        let greenPastel: Color = Color.init(red: 207, green: 236, blue: 207)
        let bluePastel: Color = Color.init(red: 154, green: 206, blue: 223)
        let liliacPastel: Color = Color.init(red: 221, green: 212, blue: 232)
        
        switch color {
        case greenPastel: return greenPastel
        case bluePastel: return bluePastel
        case liliacPastel: return liliacPastel
        default: return Color.blue
        }
        
        
    }
}


