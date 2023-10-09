//
//  ComposeGroup.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public struct ComposeGroup: Resizable, Insettable, Spacable {
    
    // MARK: - Enums
    
    public enum Direction {
        case horizontal, vertical
    }
    
    public enum Subitems {
        case repeating(ComposeItem, count: Int)
        case manual([ComposeItem])
    }
    
    // MARK: - Properties
    
    private var direction: Direction
    private var widthDimension: NSCollectionLayoutDimension
    private var heightDimension: NSCollectionLayoutDimension
    private var contentInsets: NSDirectionalEdgeInsets
    private var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    private var subitems: Subitems
    
    private var size: NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: widthDimension,
            heightDimension: heightDimension
        )
    }
    
    // MARK: - Initializer
    
    internal init(
        direction: Direction,
        widthDimension: NSCollectionLayoutDimension = .fractionalWidth(1.0),
        heightDimension: NSCollectionLayoutDimension = .fractionalHeight(1.0),
        contentInsets: NSDirectionalEdgeInsets = .zero,
        edgeSpacing: NSCollectionLayoutEdgeSpacing? = nil,
        subitems: Subitems = .manual([])
    ) {
        self.direction = direction
        self.widthDimension = widthDimension
        self.heightDimension = heightDimension
        self.contentInsets = contentInsets
        self.edgeSpacing = edgeSpacing
        self.subitems = subitems
    }
    
    // MARK: - Subitems
    
    public func subItems(_ subitems: Subitems) -> ComposeGroup {
        return mutatingCopy(self) { $0.subitems = subitems }
    }
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeGroup {
        return mutatingCopy(self) { $0.widthDimension = width }
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeGroup {
        return mutatingCopy(self) { $0.heightDimension = height }
    }
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeGroup {
        return mutatingCopy(self) { group in
            group.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
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
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: leading, top: top, trailing: trailing, bottom: bottom)
        }
    }
    
}

extension ComposeGroup: BuildableGroup {
    
    // MARK: - Buildable
    
    public func make() -> NSCollectionLayoutGroup {
        switch subitems {
        case let .repeating(item, count):
            return repeating(size: size, direction: direction, item: item.make(), count: count)
        case let .manual(items):
            return manual(size: size, direction: direction, items: items.map { $0.make() })
        }
    }
    
}

private extension ComposeGroup {
    
    // MARK: - Private Group Makers
    
    func repeating(
        size: NSCollectionLayoutSize,
        direction: Direction,
        item: NSCollectionLayoutItem,
        count: Int
    ) -> NSCollectionLayoutGroup {
        switch direction {
        case .vertical:
            if #available(iOS 16.0, *) {
                return NSCollectionLayoutGroup.vertical(layoutSize: size, repeatingSubitem: item, count: count)
            } else {
                return NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: count)
            }
        case .horizontal:
            if #available(iOS 16.0, *) {
                return NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: count)
            } else {
                return NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: count)
            }
        }
    }
    
    func manual(
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
