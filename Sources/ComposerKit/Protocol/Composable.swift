//
//  Composable.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

internal protocol Composable {
    associatedtype Parameters: LayoutParameters
    associatedtype Component
    associatedtype SubComponent
    
    var layoutParameters: Parameters { get set }
    var provider: (() -> SubComponent)? { get }
}

extension Composable {
    
    var provider: (() -> SubComponent)? {
        return nil
    }
    
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
