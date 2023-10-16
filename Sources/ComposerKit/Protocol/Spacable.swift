//
//  Spacable.swift
//  ComposerKit
//
//  Created by 이창준 on 9/28/23.
//

import UIKit

public protocol Spacable {
    func edgeSpacing(equalEdges inset: NSCollectionLayoutSpacing) -> Self
    func edgeSpacing(
        horizontal: NSCollectionLayoutSpacing,
        vertical: NSCollectionLayoutSpacing) -> Self
    func edgeSpacing(
        top: NSCollectionLayoutSpacing,
        leading: NSCollectionLayoutSpacing,
        bottom: NSCollectionLayoutSpacing,
        trailing: NSCollectionLayoutSpacing) -> Self
}

public extension Spacable {
    func edgeSpacing(equalEdges inset: NSCollectionLayoutSpacing) -> Self {
        return self.edgeSpacing(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    func edgeSpacing(
        horizontal: NSCollectionLayoutSpacing,
        vertical: NSCollectionLayoutSpacing
    ) -> Self {
        return self.edgeSpacing(top: horizontal, leading: vertical, bottom: horizontal, trailing: vertical)
    }
}
