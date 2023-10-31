//
//  BlockViewComposer.swift
//  ColorBlocks
//
//  Created by 이창준 on 9/29/23.
//

import UIKit

import ComposerKit

final class BlockViewComposer: Composer {
    typealias HomeDataSource = UICollectionViewDiffableDataSource<BlockSection, BlockCellModel>
    typealias HomeSnapshot = NSDiffableDataSourceSnapshot<BlockSection, BlockCellModel>
    typealias HomeCellRegistration = UICollectionView.CellRegistration<BlockCell, BlockCellModel>
    
    // MARK: - Properties
    
    var collectionView: UICollectionView
    
    var composeLayout: UICollectionViewComposeLayout {
        ComposeLayout { env in
            Section {
                Group(style: .grid, numberOfItems: 4) {
                    Item(style: .grid(
                        width: .fractionalWidth(0.5),
                        height: .fractionalWidth(0.5)
                    ))
                }
                .interItemSpacing(.fixed(8.0))
            }
            .interGroupSpacing(8.0)
            .orthogonalScrolling(.groupPaging)
            .boundaryItems {
                Header()
                    .widthDimension(.fractionalWidth(1.0))
                    .heightDimension(.absolute(100))
                Footer()
                    .widthDimension(.fractionalWidth(1.0))
                    .heightDimension(.absolute(150))
            }
            
            Section {
                Group(style: .grid) {
                    for _ in (1...10) {
                        Item()
                            .size(.fractionalWidth(1.0 / 10))
                    }
                }
            }
        }
        .interSectionSpacing(12.0)
    }
    
    var dataSource: HomeDataSource?
    
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        setupDataSource()
    }
    
    // MARK: - Binding
    
    func bind(_ datas: [BlockCellModel]) {
        guard datas.count != .zero else { return }
        var snapshot = HomeSnapshot()
        snapshot.appendSections([.large, .small])
        snapshot.appendItems(Array(datas.prefix(5)), toSection: .large)
        snapshot.appendItems(Array(datas[5..<datas.count]), toSection: .small)
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
        
        let headerRegistration = UICollectionView.SupplementaryRegistration(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { header,elementKind,indexPath in
            header.backgroundColor = .systemBlue
        }
        
        let footerRegistration = UICollectionView.SupplementaryRegistration(
            elementKind: UICollectionView.elementKindSectionFooter
        ) { footer, elementKind, indexPath in
            footer.backgroundColor = .systemRed
        }
        
        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            if kind == UICollectionView.elementKindSectionHeader {
                return collectionView.dequeueConfiguredReusableSupplementary(
                    using: headerRegistration, for: indexPath)
            } else if kind == UICollectionView.elementKindSectionFooter {
                return collectionView.dequeueConfiguredReusableSupplementary(
                    using: footerRegistration, for: indexPath)
            }
            return UICollectionReusableView()
        }
    }
    
}
