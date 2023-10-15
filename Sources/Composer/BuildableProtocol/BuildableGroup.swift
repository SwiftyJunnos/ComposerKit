//
//  BuildableGroup.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public protocol BuildableGroup: BuildableItem {
    func make() -> NSCollectionLayoutGroup
}
