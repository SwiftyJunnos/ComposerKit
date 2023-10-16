//
//  ComposeItem.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Item = ComposerKit.ComposeItem

public struct ComposeItem: Composable, Resizable, Insettable, Spacable {
    
    // MARK: - Layout Parameters
    
    struct ItemParameters: LayoutParameters {
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    var layoutParameters: ItemParameters
    
    // MARK: - Initializer
    
    public init(style: Style? = nil) {
        if let style {
            self.layoutParameters = style.layoutParameters
        } else {
            self.layoutParameters = ItemParameters()
        }
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeItem {
        return with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeItem {
        return with(\.heightDimension, value: height)
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeItem {
        return with(\.contentInsets, value: NSDirectionalEdgeInsets(
            top: top, leading: leading, bottom: bottom, trailing: trailing)
        )
    }
    
    // MARK: - Spacable
    
    public func edgeSpacing(
        top: NSCollectionLayoutSpacing,
        leading: NSCollectionLayoutSpacing,
        bottom: NSCollectionLayoutSpacing,
        trailing: NSCollectionLayoutSpacing
    ) -> ComposeItem {
        return with(\.edgeSpacing, value: NSCollectionLayoutEdgeSpacing(
            leading: leading, top: top, trailing: trailing, bottom: bottom)
        )
    }
    
}

extension ComposeItem: BuildableItem {
    
    // MARK: - Buildable
    
    public func make() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: size, supplementaryItems: [])
        item.contentInsets = layoutParameters.contentInsets
        item.edgeSpacing = layoutParameters.edgeSpacing
        return item
    }
    
}
