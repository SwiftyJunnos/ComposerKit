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
    
    lazy var composer: MVCHomeComposer? = .init(collectionView: collectionView)
    
    private var datas = CurrentValueSubject<[HomeCellModel], Never>([])
    
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
            (1...25).map { HomeCellModel(number: $0) }
        )
    }
    
    // MARK: - Composer
    
    func bind(composer: MVCHomeComposer) {
        datas
            .sink { datas in
                composer.bind(datas)
            }
            .store(in: &cancellables)
    }
    
}

private extension MVCHomeViewController {
    
    // MARK: - UI Configuration
    
    func configureUI() {
        view.addSubview(collectionView)
    }
    
}
