//
//  ComposeGroup.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Group = ComposerKit.ComposeGroup

public struct ComposeGroup: Composable {
    typealias Component = NSCollectionLayoutGroup
    
    public typealias ItemProvider = () -> [ComposeItem]
    public typealias SingleItemProvider = () -> ComposeItem
    
    // MARK: - Layout Parameters
    
    struct GroupParameters: LayoutParameters {
        var direction: UICollectionView.ScrollDirection
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var interItemSpacing: NSCollectionLayoutSpacing = .fixed(.zero)
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
    }
    
    // MARK: - Properties
    
    var layoutParameters: GroupParameters
    var provider: ItemProvider?
    
    // MARK: - Initializer
    
    public init(
        style: Style? = nil,
        @ItemBuilder itemProvider: @escaping ItemProvider
    ) {
        if let style {
            self.layoutParameters = style.layoutParameters
        } else {
            self.layoutParameters = GroupParameters(direction: .horizontal)
        }
        self.provider = itemProvider
    }
    
    public init(
        style: Style? = nil,
        numberOfItems: Int,
        _ itemProvider: @escaping SingleItemProvider
    ) {
        if let style {
            self.layoutParameters = style.layoutParameters
        } else {
            self.layoutParameters = GroupParameters(direction: .horizontal)
        }
        self.provider = {
            return (0..<numberOfItems).map { _ in itemProvider() }
        }
    }
    
    // MARK: - Direction
    
    public func direction(_ direction: UICollectionView.ScrollDirection) -> Self {
        return with(\.direction, value: direction)
    }
    
    // MARK: - Spacing
    
    public func interItemSpacing(_ spacing: NSCollectionLayoutSpacing) -> Self {
        return with(\.interItemSpacing, value: spacing)
    }
    
}

extension ComposeGroup: Resizable {
    
    // MARK: - Resizable
    
    public func widthDimension(_ width: NSCollectionLayoutDimension) -> ComposeGroup {
        return with(\.widthDimension, value: width)
    }
    
    public func heightDimension(_ height: NSCollectionLayoutDimension) -> ComposeGroup {
        return with(\.heightDimension, value: height)
    }
    
}

extension ComposeGroup: Insettable {
    
    // MARK: - Insettable
    
    public func contentInsets(
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat
    ) -> ComposeGroup {
        return with(\.contentInsets, value: NSDirectionalEdgeInsets(
            top: top, leading: leading, bottom: bottom, trailing: trailing)
        )
    }
    
}

extension ComposeGroup: Spacable {
    
    // MARK: - Spacable
    
    public func edgeSpacing(
        top: NSCollectionLayoutSpacing,
        leading: NSCollectionLayoutSpacing,
        bottom: NSCollectionLayoutSpacing,
        trailing: NSCollectionLayoutSpacing
    ) -> ComposeGroup {
        return with(\.edgeSpacing, value: NSCollectionLayoutEdgeSpacing(
            leading: leading, top: top, trailing: trailing, bottom: bottom)
        )
    }
    
}

extension Composable where Component == NSCollectionLayoutGroup,
                           Parameters == ComposeGroup.GroupParameters,
                           SubComponent == [ComposeItem] {
    
    func make() -> NSCollectionLayoutGroup {
        guard let item = provider?() else { fatalError() }
        
        let group = group(
            size: NSCollectionLayoutSize(
                widthDimension: layoutParameters.widthDimension,
                heightDimension: layoutParameters.heightDimension),
            direction: layoutParameters.direction,
            items: item.map { $0.make() }
        )
        group.contentInsets = layoutParameters.contentInsets
        group.interItemSpacing = layoutParameters.interItemSpacing
        return group
    }
    
    private func group(
        size: NSCollectionLayoutSize,
        direction: UICollectionView.ScrollDirection,
        items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup {
        switch direction {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: items)
        @unknown default:
            fatalError("ScrollDirection case is added. Please handle new one.")
        }
    }
    
}
