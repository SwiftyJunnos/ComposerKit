//
//  ComposeItem.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Item = ComposerKit.ComposeItem

public struct ComposeItem: Resizable, Insettable, Spacable {
    
    // MARK: - Layout Parameters
    
    struct ItemParameters: LayoutParameters {
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    private var layoutParameters: ItemParameters
    
    private var size: NSCollectionLayoutSize {
        return layoutParameters.size
    }
    
    // MARK: - Initializer
    
    public init(
        style: Style
    ) {
        self.layoutParameters = style.layoutParameters
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeItem {
        return mutatingCopy(self) { $0.layoutParameters.widthDimension = width }
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeItem {
        return mutatingCopy(self) { $0.layoutParameters.heightDimension = height }
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeItem {
        return mutatingCopy(self) { item in
            item.layoutParameters.contentInsets = NSDirectionalEdgeInsets(
                top: top, leading: leading, bottom: bottom, trailing: trailing)
        }
    }
    
    // MARK: - Spacable
    
    public func edgeSpacing(
        top: NSCollectionLayoutSpacing,
        leading: NSCollectionLayoutSpacing,
        bottom: NSCollectionLayoutSpacing,
        trailing: NSCollectionLayoutSpacing
    ) -> ComposeItem {
        return mutatingCopy(self) { item in
            item.layoutParameters.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                leading: leading, top: top, trailing: trailing, bottom: bottom)
        }
    }
    
}

extension ComposeItem: BuildableItem {
    
    // MARK: - Buildable
    
    func make() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(
            layoutSize: size,
            supplementaryItems: [] // TODO: Supplementary Item 추가
        )
    }
    
}
