//
//  CardView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    let card: Card.Symbol.RawValue
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.screenWidth / 4 - 10,
                       height: UIScreen.screenHeight / 5)
                .cornerRadius(20)
            Text(card).foregroundColor(.white)
            //                .opacity(viewModel.isFlipped ? 100 : 0)
        }
    }
}
