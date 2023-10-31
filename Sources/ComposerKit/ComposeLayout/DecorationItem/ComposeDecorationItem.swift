//
//  ComposeDecorationItem.swift
//  ComposerKit
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

public typealias DecorationItem = ComposerKit.ComposeDecorationItem

public struct ComposeDecorationItem: Composable, Insettable {
    typealias Component = NSCollectionLayoutDecorationItem
    
    // MARK: - Layout Parameters
    
    struct DecorationParameters: LayoutParameters {
        var style: Style
        var elementKind: String
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    var layoutParameters: DecorationParameters
    var provider: (() -> AnyObject)? = nil
    
    // MARK: - Initializer
    
    public init(_ style: Style = .background) {
        self.layoutParameters = style.layoutParemeters
    }
    
    // MARK: - Element Kind
    
    public func elementKind(_ elementKind: String) -> Self {
        return with(\.elementKind, value: elementKind)
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeDecorationItem {
        return with(\.contentInsets, value: NSDirectionalEdgeInsets(
            top: top, leading: leading, bottom: bottom, trailing: trailing)
        )
    }
    
}

extension Composable where Component == NSCollectionLayoutDecorationItem,
                           Parameters == ComposeDecorationItem.DecorationParameters,
                           SubComponent == AnyObject {
    
    func make() -> NSCollectionLayoutDecorationItem {
        switch layoutParameters.style {
        case .background:
            let background = NSCollectionLayoutDecorationItem.background(
                elementKind: layoutParameters.elementKind)
            background.contentInsets = layoutParameters.contentInsets
            return background
        }
    }
    
}
