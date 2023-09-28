//
//  ComposeItem.swift
//  Composer
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public struct ComposeItem: Resizable, Insettable, Spacable {
    
    // MARK: - Properties
    
    private var contentInsets: NSDirectionalEdgeInsets
    private var widthDimension: NSCollectionLayoutDimension
    private var heightDimension: NSCollectionLayoutDimension
    private var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    
    private var size: NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )
    }
    
    // MARK: - Initializer
    
    public init(
        widthDimension: NSCollectionLayoutDimension = .fractionalWidth(1.0),
        heightDimension: NSCollectionLayoutDimension = .fractionalHeight(1.0),
        contentInsets: NSDirectionalEdgeInsets = .zero,
        edgeSpacing: NSCollectionLayoutEdgeSpacing? = nil
    ) {
        self.widthDimension = widthDimension
        self.heightDimension = heightDimension
        self.contentInsets = contentInsets
        self.edgeSpacing = edgeSpacing
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeItem {
        return mutatingCopy(self) { $0.widthDimension = width }
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeItem {
        return mutatingCopy(self) { $0.heightDimension = height }
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeItem {
        return mutatingCopy(self) { item in
            item.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
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
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: leading, top: top, trailing: trailing, bottom: bottom)
        }
    }
    
}

extension ComposeItem: BuildableItem {
    
    // MARK: - Builder
    
    func make() -> NSCollectionLayoutItem {
        return NSCollectionLayoutItem(
            layoutSize: size,
            supplementaryItems: [] // TODO: Supplementary Item 추가
        )
    }
    
}
