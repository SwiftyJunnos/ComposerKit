//
//  ComposeGroup+Styles.swift
//  ComposerKit
//
//  Created by 이창준 on 9/28/23.
//

import Foundation

extension ComposeGroup {
    
    @frozen
    public enum Style {
        /// A group that completely fills the entire ``ComposeSection`` with just a single group itself.
        case full
        /// A group with ``ComposeItem``s that are arranged vertically while filling horizontally.
        case list
        /// A group with ``ComposeItem``s arranged horizontally.
        case flow
        /// A group with ``ComposeItem``s arranged in a grid pattern.
        /// ``ComposeItem``s will automatically wrapped into next line when horizontal space is filled.
        case grid
        
        internal var layoutParameters: GroupParameters {
            switch self {
            case .full:
                return .init(
                    direction: .horizontal,
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
            case .list:
                return .init(
                    direction: .vertical,
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(1.0)
                )
            case .flow:
                return .init(
                    direction: .horizontal,
                    widthDimension: .estimated(1.0)
                )
            case .grid:
                return .init(
                    direction: .horizontal,
                    widthDimension: .fractionalWidth(1.0)
                )
            }
        }
    }
    
}
