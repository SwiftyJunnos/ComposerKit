//
//  ComposeItem+Presets.swift
//  Composer
//
//  Created by 이창준 on 9/27/23.
//

import UIKit

public extension ComposeItem {
    
    static func full(
        contentInsets: NSDirectionalEdgeInsets = .zero
    ) -> Self {
        return ComposeItem()
            .widthDimension(.fractionalWidth(1.0))
            .heightDimension(.fractionalHeight(1.0))
            .contentInsets(contentInsets)
    }
    
    static func list(
        height: NSCollectionLayoutDimension,
        contentInsets: NSDirectionalEdgeInsets = .zero
    ) -> Self {
        return ComposeItem()
            .widthDimension(.fractionalWidth(1.0))
            .heightDimension(height)
            .contentInsets(contentInsets)
    }
    
    static func grid(
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        contentInsets: NSDirectionalEdgeInsets = .zero
    ) -> Self {
        return ComposeItem()
            .widthDimension(width)
            .heightDimension(height)
            .contentInsets(contentInsets)
    }
    
}
