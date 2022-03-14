//
//  RestartGame.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct RestartGame: View {

    
    var body: some View {
        ZStack {
            
        RoundedRectangle(cornerRadius: 25)
            .frame(width: UIScreen.screenWidth/3, height: 40, alignment: .center)
            .foregroundColor(.blue)
            
            Text("Restart Game")
                .foregroundColor(.white)

        }
    }
}
