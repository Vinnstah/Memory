//
//  Extension+Array.swift
//  Memory
//
//  Created by Viktor Jansson on 2022-03-05.
//

import Foundation
import SwiftUI

extension Array {
    
    func duplicate() -> [Element] {
        var array = self
        for element in array {
            array.append(element)
        }
        return array
    }
}

//extension View {
//    func frameModifier() -> RoundedRectangle {
//
//        let rectangle = self.frame(width: UIScreen.screenWidth / 4 - 10,
//                   height: UIScreen.screenHeight / 5)
//        
//        return rectangle
//    
//    }
//    
//}
