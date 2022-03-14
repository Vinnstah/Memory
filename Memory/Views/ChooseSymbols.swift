//
//  ChooseSymbols.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-14.
//

import Foundation
import SwiftUI

struct ChooseSymbols: View {
//    @ObservedObject var viewModel: CollectionOfSymbols
    var symbolTypes: [[Card.Symbol]]
    @Binding var test: [Card.Symbol]
    
    var body: some View {
        Picker("Select your symbols",
               selection: $test) {
            ForEach(0..<symbolTypes.count, content: { symbol in
                Text("\(symbol)")
            })
        }
    }
}
