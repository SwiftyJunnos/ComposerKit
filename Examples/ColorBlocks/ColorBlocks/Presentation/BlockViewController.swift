//
//  BlockViewController.swift
//  ColorBlocks
//
//  Created by 이창준 on 9/25/23.
//

import Combine
import UIKit

import ComposerKit

final class BlockViewController: UIViewController, ComposableView {
    
    // MARK: - Components
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UICollectionViewLayout()
        )
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Properties
    
    var composer: BlockViewComposer?
    
    private var datas = CurrentValueSubject<[BlockCellModel], Never>([])
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        assign(composer: composer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        datas.send(
            (1...500).map { BlockCellModel(number: $0) }
        )
    }
    
    // MARK: - Composer
    
    func bind(composer: BlockViewComposer) {
        datas
            .sink { datas in
                composer.bind(datas)
            }
            .store(in: &cancellables)
    }
    
}

private extension BlockViewController {
    
    // MARK: - UI Configuration
    
    func configureUI() {
        composer = BlockViewComposer(collectionView: collectionView)
        view.addSubview(collectionView)
    }
    
}
