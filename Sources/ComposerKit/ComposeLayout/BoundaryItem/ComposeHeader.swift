//
//  ComposeHeader.swift
//  ComposerKit
//
//  Created by 이창준 on 10/23/23.
//

import UIKit

public typealias Header = ComposerKit.ComposeHeader

public struct ComposeHeader: BoundaryPlaceable {
    
    // MARK: - Properties
    
    public var layoutParameters: BoundaryItem.Parameters
    
    // MARK: - Initializer
    
    public init() {
        self.layoutParameters = BoundaryItem.Parameters(
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeHeader {
        with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeHeader {
        with(\.heightDimension, value: height)
    }
    
}

extension ComposeHeader: BuildableBoundaryItem {
    public func make() -> NSCollectionLayoutBoundarySupplementaryItem {
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
