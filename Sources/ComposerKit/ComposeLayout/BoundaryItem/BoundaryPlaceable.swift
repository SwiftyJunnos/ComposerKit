//
//  BoundaryPlaceable.swift
//  ComposerKit
//
//  Created by 이창준 on 10/23/23.
//

import UIKit

internal protocol BoundaryPlaceable: Composable, Resizable where Component == NSCollectionLayoutBoundarySupplementaryItem,
                                                                 Parameters == BoundaryItem.Parameters,
                                                                 SubComponent == AnyObject {
    
//    public func widthDimension(_ width: NSCollectionLayoutDimension) -> Self {
//        return with(\.widthDimension, value: width)
//    }
//
//    public func heightDimension(_ height: NSCollectionLayoutDimension) -> Self {
//        return with(\.heightDimension, value: height)
//    }
//
//    public func elementKind(_ elementKind: String) -> Self {
//        return with(\.elementKind, value: elementKind)
//    }
//
//    public func alignment(_ alignment: NSRectAlignment) -> Self {
//        return with(\.alignment, value: alignment)
//    }
//
//    public func absoluteOffset(_ offset: CGPoint) -> Self {
//        return with(\.absoluteOffset, value: offset)
//    }
//
//    public func pinToVisibleBounds(_ pinToVisibleBounds: Bool) -> Self {
//        return with(\.pinToVisibleBounds, value: pinToVisibleBounds)
//    }
//
//    public func zIndex(_ zIndex: Int) -> Self {
//        return with(\.zIndex, value: zIndex)
//    }
    
}
