//
//  DataController.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Highscore")
    
    init() {
        container.loadPersistentStores { completion, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
