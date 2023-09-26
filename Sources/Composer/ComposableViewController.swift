//
//  ComposableViewController.swift
//
//  Composer
//  Created by 이창준 on 9/26/23.
//

import UIKit

@MainActor
open class ComposableViewController: UIViewController {
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds)
        return collectionView
    }()
    
    // MARK: - Initializer
    
    init(collectionView: UICollectionView) {
        super.init(nibName: nil, bundle: nil)
        self.collectionView = collectionView
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Cycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
