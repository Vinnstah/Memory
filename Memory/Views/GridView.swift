//
//  GridView.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-02.
//

import Foundation
import SwiftUI

struct GridView: View {
    @ObservedObject var viewModel: GridViewModel

}

extension GridView {
    var body: some View {
        LazyVGrid(columns: viewModel.columns, spacing: 10) {
            ForEach(viewModel.testLayout, id: \.self) { card in
                Button(
                    action: {} ,
                    label: {
                        CardView(name: card.rawValue)
                        
                    })
            }
        }
    }
}

