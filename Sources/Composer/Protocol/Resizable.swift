//
//  Resizable.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public protocol Resizable {
    func widthDimension(_ width: NSCollectionLayoutDimension) -> Self
    func heightDimension(_ height: NSCollectionLayoutDimension) -> Self
    func size(_ size: NSCollectionLayoutDimension) -> Self
}

public extension Resizable {
    func size(_ size: NSCollectionLayoutDimension) -> Self {
        return self.widthDimension(size).heightDimension(size)
    }
}
