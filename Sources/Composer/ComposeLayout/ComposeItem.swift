//
//  ComposeItem.swift
//
//  Composer
//  Created by 이창준 on 9/26/23.
//

import UIKit

public struct ComposeItem: ResizableComponent, InsettableComponent {
    
    // MARK: - Properties
    
    private var contentInsets: NSDirectionalEdgeInsets
    private var widthDimension: NSCollectionLayoutDimension
    private var heightDimension: NSCollectionLayoutDimension
    
    private var size: NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )
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
