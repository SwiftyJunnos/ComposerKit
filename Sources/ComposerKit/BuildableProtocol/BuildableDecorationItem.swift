//
//  BuildableDecorationItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

public protocol BuildableDecorationItem {
    func make() -> NSCollectionLayoutDecorationItem
}
