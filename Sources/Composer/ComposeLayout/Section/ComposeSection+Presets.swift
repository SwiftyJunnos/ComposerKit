//
//  ComposeSection+Presets.swift
//  ComposerKit
//
//  Created by 이창준 on 9/28/23.
//

import UIKit

public extension ComposeSection {
    
    static func base(group: ComposeGroup) -> Self {
        return ComposeSection {
            group
        }
    }
    
}
