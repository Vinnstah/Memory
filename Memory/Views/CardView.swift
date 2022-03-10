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
 
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(card.checkIfIsFlipped() ? Color.blue : Color.teal)
                .frame(width: UIScreen.screenWidth / 4 - 10,
                       height: UIScreen.screenHeight / 5)
            
            
            (card.checkIfIsFlipped() ? Text(card.symbol.display).foregroundColor(.white) : Text(""))
                  
        }
    }
}


