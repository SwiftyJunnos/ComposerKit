//
//  ComposeBoundaryItem+Styles.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

extension ComposeBoundaryItem {
    
    @frozen
    public enum Style {
        case header
        case footer
        
        internal var layoutParameters: BoundaryItemParameters {
            switch self {
            case .header:
                return .init(
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            case .footer:
                return .init(
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
            }
        }
    }
    
}
