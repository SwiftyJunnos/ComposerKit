//
//  ComposeItem+Styles.swift
//  ComposerKit
//
//  Created by 이창준 on 9/27/23.
//

import UIKit

extension ComposeItem {
    
    @frozen
    public enum Style {
        /// An item that completely fills the entire ``ComposeGroup`` with just a single item itself.
        case full
        /// An item arranged vertically while filling horizontally.
        case listRow
        /// An item having individual ``NSCollectionLayoutDimension`` for both width and height.
        case grid
        
        internal var layoutParameters: ItemParameters {
            switch self {
            case .full:
                return .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            case .listRow:
                return .init(
                    widthDimension: .fractionalWidth(1.0)
                )
            case .grid:
                return .init()
            }
        }
    }
    
}
