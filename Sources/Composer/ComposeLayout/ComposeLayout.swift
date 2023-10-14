//
//  ComposeLayout.swift
//  ComposerKit
//
//  Created by 이창준 on 10/9/23.
//

import UIKit

@MainActor
public struct UICollectionViewComposeLayout {
    public typealias SectionProvider = (NSCollectionLayoutEnvironment) -> [ComposeSection]
    
    // MARK: - Properties
    
    private let sectionProvider: SectionProvider
    
    // MARK: - Initializer
    
    public init(
        @SectionBuilder sectionProvider: @escaping SectionProvider
    ) {
        self.sectionProvider = sectionProvider
    }
    
}

extension UICollectionViewComposeLayout: BuildableLayout {
    func make() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(
            sectionProvider: { sectionIndex, environment in
                return sectionProvider(environment)[sectionIndex].make()
            },
            configuration: UICollectionViewCompositionalLayoutConfiguration()
        )
    }
}
