//
//  ComposeBoundaryItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

public func Header() -> ComposerKit.ComposeBoundaryItem {
    return ComposeBoundaryItem(.header)
}

public func Footer() -> ComposerKit.ComposeBoundaryItem {
    return ComposeBoundaryItem(.footer)
}

public struct ComposeBoundaryItem: Composable {
    typealias Component = NSCollectionLayoutBoundarySupplementaryItem
    typealias SubComponent = AnyObject
    
    // MARK: - Layout Parameters
    
    struct BoundaryItemParameters: LayoutParameters {
        var elementKind: String
        var alignment: NSRectAlignment
        public var widthDimension: NSCollectionLayoutDimension = .fractionalWidth(1.0)
        public var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        public var contentInsets: NSDirectionalEdgeInsets = .zero
        public var edgeSpacing: NSCollectionLayoutEdgeSpacing?
        var absoluteOffset: CGPoint = .zero
        var zIndex: Int = 0
        var pinToVisibleBounds: Bool = false
    }
    
    // MARK: - Properties
    
    var layoutParameters: BoundaryItemParameters
    
    // MARK: - Initializer
    
    public init(_ style: Style) {
        self.layoutParameters = style.layoutParameters
    }
    
    // MARK: - Element Kind
    
    public func elementKind(_ elementKind: String) -> Self {
        return with(\.elementKind, value: elementKind)
    }
    
    // MARK: - Alignment
    
    public func alignment(_ alignment: NSRectAlignment) -> Self {
        return with(\.alignment, value: alignment)
    }
    
    // MARK: - Absolute Offset
    
    public func absoluteOffset(_ offset: CGPoint) -> Self {
        return with(\.absoluteOffset, value: offset)
    }
    
    // MARK: - Pin to Visible Bounds
    
    public func pinToVisibleBounds(_ pinToVisibleBounds: Bool) -> Self {
        return with(\.pinToVisibleBounds, value: pinToVisibleBounds)
    }
    
    // MARK: - z Index
    
    public func zIndex(_ zIndex: Int) -> Self {
        return with(\.zIndex, value: zIndex)
    }
    
}

extension ComposeBoundaryItem: Resizable {
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeBoundaryItem {
        return with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeBoundaryItem {
        return with(\.heightDimension, value: height)
    }
    
}

extension Composable where Component == NSCollectionLayoutBoundarySupplementaryItem,
                           Parameters == ComposeBoundaryItem.BoundaryItemParameters {
    
    func make() -> NSCollectionLayoutBoundarySupplementaryItem {
        let boundaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutParameters.size,
            elementKind: layoutParameters.elementKind,
            alignment: layoutParameters.alignment,
            absoluteOffset: layoutParameters.absoluteOffset
        )
        boundaryItem.pinToVisibleBounds = layoutParameters.pinToVisibleBounds
        boundaryItem.zIndex = layoutParameters.zIndex
        return boundaryItem
    }
    
}
