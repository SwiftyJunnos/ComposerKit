//
//  ComposeGroup.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Group = ComposerKit.ComposeGroup

public struct ComposeGroup: Resizable, Insettable, Spacable {
    public typealias ItemProvider = () -> [ComposeItem]
    
    // MARK: - Enums
    
    public enum Direction {
        case horizontal, vertical
    }
    
    // MARK: - Layout Parameters
    
    struct GroupParameters: LayoutParameters {
        var direction: Direction
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    private var layoutParameters: GroupParameters
    
    private let itemProvider: ItemProvider
    
    private var size: NSCollectionLayoutSize {
        return layoutParameters.size
    }
    
    // MARK: - Initializer
    
    public init(
        style: Style,
        @ItemBuilder itemProvider: @escaping ItemProvider
    ) {
        self.layoutParameters = style.layoutParameters
        self.itemProvider = itemProvider
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeGroup {
        return mutatingCopy(self) { $0.layoutParameters.widthDimension = width }
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeGroup {
        return mutatingCopy(self) { $0.layoutParameters.heightDimension = height }
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeGroup {
        return mutatingCopy(self) { group in
            group.layoutParameters.contentInsets = NSDirectionalEdgeInsets(
                top: top, leading: leading, bottom: bottom, trailing: trailing)
        }
    }
    
    // MARK: - Spacable
    
    public func edgeSpacing(
        top: NSCollectionLayoutSpacing,
        leading: NSCollectionLayoutSpacing,
        bottom: NSCollectionLayoutSpacing,
        trailing: NSCollectionLayoutSpacing
    ) -> ComposeGroup {
        return mutatingCopy(self) { item in
            item.layoutParameters.edgeSpacing = NSCollectionLayoutEdgeSpacing(
                leading: leading, top: top, trailing: trailing, bottom: bottom)
        }
    }
    
}

extension ComposeGroup: BuildableGroup {
    
    // MARK: - Buildable
    
    public func make() -> NSCollectionLayoutGroup {
        return group(
            size: NSCollectionLayoutSize(
                widthDimension: layoutParameters.widthDimension,
                heightDimension: layoutParameters.heightDimension),
            direction: layoutParameters.direction,
            items: itemProvider().map { $0.make() }
        )
    }
    
}

private extension ComposeGroup {
    
    // MARK: - Private Group Maker
    
    func group(
        size: NSCollectionLayoutSize,
        direction: Direction,
        items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup {
        switch direction {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: items)
        }
    }
    
}
