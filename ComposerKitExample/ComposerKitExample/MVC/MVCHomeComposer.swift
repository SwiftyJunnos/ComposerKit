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
        Section {
            Group(style: .full) {
                Item(style: .full)
            }
        }
        
        Section {
            Group(style: .grid) {
                Item(style: .grid)
                    .size(.absolute(50))
            }
        }
    }
    
    var snapshot: NSDiffableDataSourceSnapshot<HomeSection, HomeCellModel>?
    
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
}
