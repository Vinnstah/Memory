//
//  MemoryApp.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-01.
//

import SwiftUI

@main
struct MemoryApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
//            StartupView()
//            StartScreen()
            CustomTabView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
