//
//  Composable.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

internal protocol Composable {
    associatedtype Parameters: LayoutParameters
    
    var layoutParameters: Parameters { get set }
}

extension Composable {
    
    internal var size: NSCollectionLayoutSize {
        return layoutParameters.size
    }
    
    internal func with<V>(
        _ keyPath: WritableKeyPath<Parameters, V>,
        value: V
    ) -> Self {
        var mutableInstance = self
        mutableInstance.layoutParameters[keyPath: keyPath] = value
        return mutableInstance
    }
    
}
