//
//  MemoryApp.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import SwiftUI

@main
struct MemoryApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: CardsViewModel(idOfFirstFlippedCard: .init(), idOfSecondFlippedCard: .init(), matchedCardIDs: .init()))
        }
    }
}
