//
//  BuildableBoundaryItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

public protocol BuildableBoundaryItem {
    func make() -> NSCollectionLayoutBoundarySupplementaryItem
}
