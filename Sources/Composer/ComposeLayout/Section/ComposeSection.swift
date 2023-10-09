//
//  ComposeSection.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

import UIKit

public struct ComposeSection {
    
    // MARK: - Properties
    
    private var group: ComposeGroup
    
    // MARK: - Initializer
    
    public init(group: () -> ComposeGroup) {
        self.group = group()
    }
    
}

extension ComposeSection: BuildableSection {
    
    // MARK: - Buildable
    
    func make() -> NSCollectionLayoutSection {
        return NSCollectionLayoutSection(group: group.make())
    }
    
}
