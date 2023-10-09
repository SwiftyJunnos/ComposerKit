//
//  HomeCell.swift
//  ComposerExample
//
//  Created by 이창준 on 9/30/23.
//

import UIKit

import ComposerKit

struct HomeCellModel: ItemModelType {
    let number: Int
}

final class HomeCell: UICollectionViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(_ model: HomeCellModel) {
        self.label.text = String(model.number)
    }
    
}
