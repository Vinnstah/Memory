//
//  RestartGame.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct RestartGame: View {
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
            Button(action: {
                viewModel.clearVariablesAndRestartGame()
            
            }, label: {
                Text("Restart Game")
                
            })
    }
}
