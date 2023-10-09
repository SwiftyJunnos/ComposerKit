//
//  Composer.swift
//  ComposerKit
//
//  Created by 이창준 on 9/29/23.
//

import UIKit

@MainActor
public protocol Composer: AnyObject {
    associatedtype SectionModelType: ComposerKit.SectionModelType
    associatedtype ItemModelType: ComposerKit.ItemModelType
    
    var collectionView: UICollectionView { get set }
    var layout: UICollectionViewComposeLayout { get set }
    var snapshot: NSDiffableDataSourceSnapshot<SectionModelType, ItemModelType>? { get set }
    
    init(collectionView: UICollectionView)
    
    func build()
    
}

extension Composer {
    
    var snapshot: NSDiffableDataSourceSnapshot<SectionModelType, ItemModelType>? {
        get {
            return snapshot
        }
        set {
            if let snapshot = newValue {
                self.snapshot = snapshot
            }
        }
    }
    
    public func build() {
        collectionView.setCollectionViewLayout(layout.make(), animated: true)
    }
    
}
