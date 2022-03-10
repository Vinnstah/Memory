//
//  CardView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var card: Card
    var isCardFlipped: Bool
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .fill(isCardFlipped ? Color.blue : Color.teal)
                .frame(width: UIScreen.screenWidth / 4 - 10,
                       height: UIScreen.screenHeight / 5)
            
            
            (isCardFlipped ? Text(card.symbol.display).foregroundColor(.white) : Text(""))
                  
        }
    }
}


