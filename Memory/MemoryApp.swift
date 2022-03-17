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
            StartupView(viewModel: CardsViewModel())
        }
    }
}
