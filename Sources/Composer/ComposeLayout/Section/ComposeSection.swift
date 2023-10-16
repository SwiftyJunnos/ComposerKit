//
//  ComposeSection.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Section = ComposerKit.ComposeSection

public struct ComposeSection: Composable {
    public typealias GroupProvider = () -> ComposeGroup
    public typealias BoundaryItemProvider = () -> [BuildableBoundaryItem]
    public typealias DecorationItemProvider = () -> [BuildableDecorationItem]
    
    // MARK: - Layout Parameters
    
    struct SectionParameters: LayoutParameters {
        var widthDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var heightDimension: NSCollectionLayoutDimension = .estimated(1.0)
        var contentInsets: NSDirectionalEdgeInsets = .zero
        var interGroupSpacing: CGFloat = .zero
        var edgeSpacing: NSCollectionLayoutEdgeSpacing?
        var boundaryItems: [BuildableBoundaryItem] = []
        var decorationItems: [BuildableDecorationItem] = []
        var orthogonalScrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none
        var visibleItemsInvalidationHandler: NSCollectionLayoutSectionVisibleItemsInvalidationHandler?
    }
    
    // MARK: - Properties
    
    var layoutParameters: SectionParameters
    
    private let groupProvider: GroupProvider
    
    // MARK: - Initializer
    
    public init(
        @SingleComponentBuilder
        _ groupProvider: @escaping GroupProvider
    ) {
        self.groupProvider = groupProvider
        self.layoutParameters = SectionParameters()
    }
    
    // MARK: - Spacing
    
    public func interGroupSpacing(_ spacing: CGFloat) -> Self {
        return with(\.interGroupSpacing, value: spacing)
    }
    
    // MARK: - Boundary Items
    
    public func boundaryItems(
        @BoundaryItemBuilder
        _ boundaryItemProvider: @escaping BoundaryItemProvider
    ) -> Self {
        return with(\.boundaryItems, value: boundaryItemProvider())
    }
    
    public func decorationItems(
        @DecorationItemBuilder
        _ decorationItemProvider: @escaping DecorationItemProvider
    ) -> Self {
        return with(\.decorationItems, value: decorationItemProvider())
    }
    
    // MARK: - Orthogonal Scrolling Behavior
    
    public func orthogonalScrolling(_ behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) -> Self {
        return with(\.orthogonalScrollingBehavior, value: behavior)
    }
    
    // MARK: - Visible Items Invalidation Handler
    
    public func visibleItemsInvalidationHandler(
        _ visibleItemsInvalidationHandler: @escaping NSCollectionLayoutSectionVisibleItemsInvalidationHandler
    ) -> Self {
        return with(\.visibleItemsInvalidationHandler, value: visibleItemsInvalidationHandler)
    }
    
}

extension ComposeSection: BuildableSection {
    
    // MARK: - Buildable
    
    public func make() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: groupProvider().make())
        section.interGroupSpacing = layoutParameters.interGroupSpacing
        section.boundarySupplementaryItems = layoutParameters.boundaryItems.map { $0.make() }
        section.decorationItems = layoutParameters.decorationItems.map { $0.make() }
        section.orthogonalScrollingBehavior = layoutParameters.orthogonalScrollingBehavior
        section.visibleItemsInvalidationHandler = layoutParameters.visibleItemsInvalidationHandler
        return section
    }
    
}
