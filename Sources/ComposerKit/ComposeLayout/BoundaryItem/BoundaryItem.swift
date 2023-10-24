//
//  BoundaryItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/23/23.
//

import UIKit

@frozen
public enum BoundaryItem {
    
    public struct Parameters: LayoutParameters {
        var elementKind: String
        var alignment: NSRectAlignment
        public var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        public var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        public var contentInsets: NSDirectionalEdgeInsets = .zero
        public var edgeSpacing: NSCollectionLayoutEdgeSpacing?
        var absoluteOffset: CGPoint = .zero
        var zIndex: Int = 0
        var pinToVisibleBounds: Bool = false
    }
    
}
