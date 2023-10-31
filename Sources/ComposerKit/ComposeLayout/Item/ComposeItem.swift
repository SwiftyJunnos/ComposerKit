//
//  ComposeItem.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Item = ComposerKit.ComposeItem

public struct ComposeItem: Composable {
    typealias Component = NSCollectionLayoutItem
    
    // MARK: - Layout Parameters
    
    struct ItemParameters: LayoutParameters {
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    var layoutParameters: ItemParameters
    var provider: (() -> AnyObject)? = nil
    
    // MARK: - Initializer
    
    public init(style: Style? = nil) {
        if let style {
            self.layoutParameters = style.layoutParameters
        } else {
            self.layoutParameters = ItemParameters()
        }
    }
    
}

extension ComposeItem: Resizable {
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeItem {
        return with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeItem {
        return with(\.heightDimension, value: height)
    }
    
}

extension ComposeItem: Insettable {
    
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
    
}

extension ComposeItem: Spacable {
    
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

extension Composable where Component == NSCollectionLayoutItem,
                           Parameters == ComposeItem.ItemParameters,
                           SubComponent == AnyObject {
    
    func make() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: size, supplementaryItems: [])
        item.contentInsets = layoutParameters.contentInsets
        item.edgeSpacing = layoutParameters.edgeSpacing
        return item
    }
    
}
