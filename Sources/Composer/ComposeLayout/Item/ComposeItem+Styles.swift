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
        case listRow(height: NSCollectionLayoutDimension)
        /// An item having individual ``NSCollectionLayoutDimension`` for both width and height.
        ///
        /// > Note:
        /// > Should specify both `widthDimension` and `heightDimension` since their default
        /// value are both `.estimated(1.0)`.
        case grid(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension)
        
        internal var layoutParameters: ItemParameters {
            switch self {
            case .full:
                return .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            case let .listRow(heightDimension):
                return .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: heightDimension
                )
            case let .grid(widthDimension, heightDimension):
                return .init(
                    widthDimension: widthDimension,
                    heightDimension: heightDimension
                )
            }
        }
    }
    
}
