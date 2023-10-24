//
//  LayoutParameters.swift
//  ComposerKit
//
//  Created by 이창준 on 10/14/23.
//

import UIKit

/// Internal data type to store several properties for drawing layout.
internal protocol LayoutParameters {
    var widthDimension: NSCollectionLayoutDimension { get set }
    var heightDimension: NSCollectionLayoutDimension { get set }
    var contentInsets: NSDirectionalEdgeInsets { get set }
    var edgeSpacing: NSCollectionLayoutEdgeSpacing? { get set }
}

extension LayoutParameters {
    internal var size: NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: self.widthDimension,
            heightDimension: self.heightDimension
        )
    }
}
