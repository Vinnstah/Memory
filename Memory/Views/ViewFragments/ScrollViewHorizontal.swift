//
//  ScrollViewHorizontal.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-18.
//

import SwiftUI

/// Custom vertical scroll view with centered content vertically
///
struct HScrollView<Content>: View where Content: View {
  @ViewBuilder let content: Content
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.horizontal) {
        content
          .frame(width: geometry.size.width)
          .frame(minHeight: geometry.size.height)
      }
    }
  }
}
