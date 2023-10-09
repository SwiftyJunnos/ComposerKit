//
//  ComposeGroup+Presets.swift
//  ComposerKit
//
//  Created by 이창준 on 9/28/23.
//

import Foundation

public extension ComposeGroup {
    
    static func full() -> Self {
        return ComposeGroup(direction: .horizontal)
            .widthDimension(.fractionalWidth(1.0))
            .heightDimension(.fractionalHeight(1.0))
    }
    
    // singleFullList (height, inset, innerGroup)
    static func singleList() -> Self {
        return ComposeGroup(direction: .horizontal)
    }
    
    // list (width, numberOfItems, spacing, inset, innerGroup)
    static func list() -> Self {
        return ComposeGroup(direction: .horizontal)
    }
    
    // grid (height, numberOfItems, spacing, inset, innerGroup)
    static func grid() -> Self {
        return ComposeGroup(direction: .horizontal)
    }
    
    // flow (height, numberOfItems, spacing, inset, innerGroup)
    static func banner() -> Self {
        return ComposeGroup(direction: .horizontal)
    }
    
}
