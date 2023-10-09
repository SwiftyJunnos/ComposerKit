//
//  BuildableLayout.swift
//  ComposerKit
//
//  Created by 이창준 on 10/9/23.
//

import UIKit

internal protocol BuildableLayout {
    func make() -> UICollectionViewCompositionalLayout
}
