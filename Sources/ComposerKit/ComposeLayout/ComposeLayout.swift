//
//  ComposeLayout.swift
//  ComposerKit
//
//  Created by 이창준 on 10/9/23.
//

import UIKit

public typealias Compose = ComposerKit.UICollectionViewComposeLayout

@MainActor
public struct UICollectionViewComposeLayout {
    public typealias SectionProvider = (NSCollectionLayoutEnvironment) -> [BuildableSection]
    public typealias BoundaryItemProvider = () -> [ComposeBoundaryItem]
    
    // MARK: - Properties
    
    private let sectionProvider: SectionProvider
    
    private var configuration: UICollectionViewCompositionalLayoutConfiguration = .init()
    
    // MARK: - Initializer
    
    public init(
        @SectionBuilder sectionProvider: @escaping SectionProvider
    ) {
        self.sectionProvider = sectionProvider
    }
    
    // MARK: - Scroll Direction
    
    public func scrollDirection(_ direction: UICollectionView.ScrollDirection) -> Self {
        return with(\.scrollDirection, value: direction)
    }
    
    // MARK: - Spacing
    
    public func interSectionSpacing(_ spacing: CGFloat) -> Self {
        return with(\.interSectionSpacing, value: spacing)
    }
    
    // MARK: - Boundary Items
    
    public func boundaryItems(
        @BoundaryItemBuilder
        _ boundaryItemProvider: @escaping BoundaryItemProvider
    ) -> Self {
        let boundaryItems = boundaryItemProvider().map { $0.make() }
        return with(\.boundarySupplementaryItems, value: boundaryItems)
    }
    
}

extension UICollectionViewComposeLayout: BuildableLayout {
    public func make() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { sectionIndex, environment in
                return sectionProvider(environment)[sectionIndex].make()
            },
            configuration: configuration
        )
        return layout
    }
}

private extension UICollectionViewComposeLayout {
    func with<V>(
        _ keyPath: WritableKeyPath<UICollectionViewCompositionalLayoutConfiguration, V>,
        value: V
    ) -> Self {
        var mutableInstance = self
        mutableInstance.configuration[keyPath: keyPath] = value
        return mutableInstance
    }
}
