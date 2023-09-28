//
//  HomeSection.swift
//
//  ComposerExample
//  Created by 이창준 on 9/27/23.
//

import Foundation

import Composer

final class HomeSection: ComposeModel {
    
    var item: ComposeItem {
        return .full()
    }
    
    var group: ComposeGroup {
        return ComposeGroup()
    }
    
    var section: ComposeSection {
        return ComposeSection()
    }
    
}
