//
//  Composer.swift
//  ComposerKit
//
//  Created by 이창준 on 9/29/23.
//

import UIKit

/// A `Composer` is responsible for rendering a `UICollectionView` based on the
/// specifications defined in ``composeLayout``. `Composer` holds essential
/// properties used for configuring the layout and data source of the
/// `UICollectionView`.
///
/// When you apply a `UICollectionViewDiffableDataSource` to
/// the ``dataSource``, it automatically triggers updates to the layout and cells of
/// the `UICollectionView`.
@MainActor
public protocol Composer: AnyObject {
    associatedtype SectionModelType: ComposerKit.SectionModelType
    associatedtype ItemModelType: ComposerKit.ItemModelType
    
    /// A `UICollectionView` managed by `Composer`.
    var collectionView: UICollectionView { get set }
    /// A ``UICollectionViewComposeLayout`` which will be provided for
    /// ``collectionView``. It should be defined using DSL style code.
    ///
    /// In this example, layout is structured with two sections: the first section
    /// contains two lists with different row heights, while the second section occupies
    /// the entire screen using a single cell:
    /// ```swift
    /// var composeLayout = UICollectionViewComposeLayout { environment in
    ///   Section {
    ///     Group(style: .list) {
    ///       Item(style: .listRow)
    ///         .heightDimension(.absolute(60))
    ///       Item(style: .listRow)
    ///         .heightDimension(.absolute(100))
    ///     }
    ///   }
    ///
    ///   Section {
    ///     Group(style: .full) {
    ///       Item(style: .full)
    ///     }
    ///   }
    /// }
    var composeLayout: UICollectionViewComposeLayout { get set }
    var dataSource: UICollectionViewDiffableDataSource<SectionModelType, ItemModelType>? { get set }
    
    init(collectionView: UICollectionView)
    
    func play(using layout: UICollectionViewComposeLayout)
}

extension Composer {
    
    var collectionView: UICollectionView {
        get {
            return collectionView
        }
        set {
            self.collectionView = newValue
            self.play(using: self.composeLayout)
        }
    }
    
    var composeLayout: UICollectionViewComposeLayout {
        get {
            return composeLayout
        }
        set {
            self.composeLayout = newValue
            self.play(using: newValue)
        }
    }
    
    public var currentSnapshot: NSDiffableDataSourceSnapshot<SectionModelType, ItemModelType>? {
        return self.dataSource?.snapshot()
    }
    
    public func play(using layout: UICollectionViewComposeLayout) {
        collectionView.setCollectionViewLayout(layout.make(), animated: true)
    }
    
    public func play() {
        play(using: composeLayout)
    }
    
}
