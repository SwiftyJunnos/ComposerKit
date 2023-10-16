//
//  ComposeBoundaryItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

public typealias BoundaryItem = ComposerKit.ComposeBoundaryItem

public struct ComposeBoundaryItem: Composable, Resizable {
    
    // MARK: - Layout Parameters
    
    struct BoundaryItemParameters: LayoutParameters {
        var elementKind: String
        var alignment: NSRectAlignment
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var zIndex: Int = .zero
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
        var pinToVisibleBounds: Bool = false
        var containerAnchor: NSCollectionLayoutAnchor = .init(edges: .all)
        var itemAnchor: NSCollectionLayoutAnchor = .init(edges: .all)
    }
    
    // MARK: - Properties
    
    var layoutParameters: BoundaryItemParameters
    
    // MARK: - Initializer
    
    public init(_ style: Style) {
        self.layoutParameters = style.layoutParameters
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeBoundaryItem {
        return with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeBoundaryItem {
        return with(\.heightDimension, value: height)
    }
    
    // MARK: - Element Kind
    
    public func elementKind(_ elementKind: String) -> Self {
        return with(\.elementKind, value: elementKind)
    }
    
    // MARK: - Alignment
    
    public func alignment(_ alignment: NSRectAlignment) -> Self {
        return with(\.alignment, value: alignment)
    }
    
    // MARK: - Pin to Visible Bounds
    
    public func pinToVisibleBounds(_ pinToVisibleBounds: Bool) -> Self {
        return with(\.pinToVisibleBounds, value: pinToVisibleBounds)
    }
    
    // MARK: - z Index
    
    public func zIndex(_ zIndex: Int) -> Self {
        return with(\.zIndex, value: zIndex)
    }
    
    // MARK: - Layout Anchors
    
    public func containerAnchor(_ anchor: NSCollectionLayoutAnchor) -> Self {
        return with(\.containerAnchor, value: anchor)
    }
    
    public func itemAnchor(_ anchor: NSCollectionLayoutAnchor) -> Self {
        return with(\.itemAnchor, value: anchor)
    }
    
}

extension ComposeBoundaryItem: BuildableBoundaryItem {
    
    public func make() -> NSCollectionLayoutBoundarySupplementaryItem {
        let boundaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutParameters.size,
            elementKind: layoutParameters.elementKind,
            containerAnchor: layoutParameters.containerAnchor,
            itemAnchor: layoutParameters.itemAnchor
        )
        boundaryItem.pinToVisibleBounds = layoutParameters.pinToVisibleBounds
        boundaryItem.zIndex = layoutParameters.zIndex
        return boundaryItem
    }
    
}
