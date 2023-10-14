//
//  ComposeSection.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public typealias Section = ComposerKit.ComposeSection

public struct ComposeSection {
    public typealias GroupProvider = () -> ComposeGroup
    
    // MARK: - Properties
    
    private let groupProvider: GroupProvider
    
    // MARK: - Initializer
    
    public init(
        @GroupBuilder groupProvider: @escaping GroupProvider
    ) {
        self.groupProvider = groupProvider
    }
    
}

extension ComposeSection: BuildableSection {
    
    // MARK: - Buildable
    
    func make() -> NSCollectionLayoutSection {
        return NSCollectionLayoutSection(group: groupProvider().make())
    }
    
}
