//
//  MVCHomeComposer.swift
//  ComposerExample
//
//  Created by 이창준 on 9/29/23.
//

import UIKit

import ComposerKit

final class MVCHomeComposer: Composer {
    
    // MARK: - Properties
    
    var collectionView: UICollectionView
    
    lazy var layout = UICollectionViewComposeLayout { env in
        ComposeSection {
            .full()
            .subItems(.manual([.full()]))
        }
    }
    
    var snapshot: NSDiffableDataSourceSnapshot<HomeSection, HomeCellModel>? {
        didSet { print(snapshot) }
    }
    
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
}
