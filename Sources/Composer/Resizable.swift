//
//  Resizable.swift
//  Composer
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public protocol Resizable {
    func widthDimension(_ width: NSCollectionLayoutDimension) -> Self
    func heightDimension(_ height: NSCollectionLayoutDimension) -> Self
    func size(_ size: NSCollectionLayoutSize) -> Self
}

public extension Resizable {
    func size(_ size: NSCollectionLayoutSize) -> Self {
        return self.widthDimension(size.widthDimension).heightDimension(size.heightDimension)
    }
}
