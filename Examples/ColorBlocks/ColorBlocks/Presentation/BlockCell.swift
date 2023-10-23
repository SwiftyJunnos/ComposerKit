//
//  BlockCell.swift
//  ColorBlocks
//
//  Created by 이창준 on 9/30/23.
//

import UIKit

import ComposerKit

struct BlockCellModel: Hashable {
    let number: Int
}

final class BlockCell: UICollectionViewCell {
    
    static let randomColors: [UIColor] = [
        .systemRed, .systemBlue, .systemGreen, .systemYellow, .systemPink, .systemOrange, .systemCyan
    ]
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        let constraints = [
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(_ model: BlockCellModel) {
        self.label.text = String(model.number)
        self.backgroundColor = BlockCell.randomColors.randomElement()
    }
    
}
