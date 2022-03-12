//
//  Extension+Set.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-12.
//

import Foundation

extension Set {
    
    mutating func insert(_ elements: Element...) {
        insert(elements)
    }
    
    mutating func insert(_ elements: [Element]) {
        for element in elements {
            insert(element)
        }
    }
}
