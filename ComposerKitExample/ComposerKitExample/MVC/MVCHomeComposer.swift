//
//  MVCHomeComposer.swift
//  ComposerExample
//
//  Created by 이창준 on 9/29/23.
//

import UIKit

import ComposerKit

final class MVCHomeComposer: Composer {
    typealias HomeDataSource = UICollectionViewDiffableDataSource<HomeSection, HomeCellModel>
    typealias HomeSnapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeCellModel>
    typealias HomeCellRegistration = UICollectionView.CellRegistration<HomeCell, HomeCellModel>
    
    // MARK: - Properties
    
    var collectionView: UICollectionView
    
    lazy var composeLayout = UICollectionViewComposeLayout { env in
        Section {
            Group(style: .full) {
                Item(style: .full)
                Item(style: .full)
            }
        }
        
        Section {
            Group(style: .grid) {
//                Group(style: .full) {
//                    Item(style: .grid)
//                }
                
                Item(style: .grid)
                    .size(.estimated(50))
                
//                Item()
//                    .widthDimension(.fractionalHeight(1.0))
//                
//                if Int.random(in: 1...5) == 2 {
//                    Item()
//                } else {
//                    Item()
//                }
            }
        }
    }
    
    var dataSource: HomeDataSource?
    
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        setupDataSource()
    }
    
    // MARK: - Binding
    
    func bind(_ datas: [HomeCellModel]) {
        guard datas.count != .zero else { return }
        var snapshot = HomeSnapshot()
        snapshot.appendSections([.home, .list])
        snapshot.appendItems(Array(datas.prefix(2)), toSection: .home)
        snapshot.appendItems(Array(datas[2..<datas.count]), toSection: .list)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Setup
    
    private func setupDataSource() {
        let cellRegistration = HomeCellRegistration { cell, _, model in
            cell.bind(model)
        }
        
        dataSource = HomeDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: itemIdentifier
                )
            }
        )
    }
    
}
