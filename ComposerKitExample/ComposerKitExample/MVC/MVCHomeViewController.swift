//
//  MVCHomeViewController.swift
//  ComposerExample
//
//  Created by 이창준 on 9/25/23.
//

import Combine
import UIKit

import ComposerKit

final class MVCHomeViewController: UIViewController, ComposableView {
    typealias MVCHomeDataSource = UICollectionViewDiffableDataSource<HomeSection, HomeCellModel>
    typealias MVCHomeCellRegistration = UICollectionView.CellRegistration<HomeCell, HomeCellModel>
    typealias MVCHomeSnapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeCellModel>
    
    // MARK: - Components
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.frame,
            collectionViewLayout: UICollectionViewLayout()
        )
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    // MARK: - Properties
    
    lazy var composer = {
        let composer = MVCHomeComposer(collectionView: collectionView)
        bind(composer: composer)
        composer.build()
        return composer
    }()
    
    private var dataSource: MVCHomeDataSource?
    
    private var currentSnapshot: PassthroughSubject<MVCHomeSnapshot?, Never>?
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
        print(composer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var snapshot: MVCHomeSnapshot = .init()
        snapshot.appendSections([.home])
        snapshot.appendItems([.init(number: 1)], toSection: .home)
        dataSource?.apply(snapshot)
        currentSnapshot?.send(snapshot)
    }
    
    // MARK: - Composer
    
    func bind(composer: MVCHomeComposer) {
        currentSnapshot?
            .print()
            .assign(to: \.snapshot, on: self.composer)
            .store(in: &cancellables)
    }
    
}

private extension MVCHomeViewController {
    
    // MARK: - UI Configuration
    
    func configureUI() {
        view.addSubview(collectionView)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - CollectionView Configuration
    
    func configureCollectionView() {
        let cellRegistration = MVCHomeCellRegistration { cell, _, model in
            cell.bind(model)
        }
        
        dataSource = MVCHomeDataSource(collectionView: collectionView,
                                       cellProvider: { collectionView, indexPath, model in
            collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: model
            )}
        )
    }
    
}
