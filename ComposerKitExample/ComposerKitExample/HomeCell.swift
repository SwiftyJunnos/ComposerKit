//
//  HomeCell.swift
//  ComposerExample
//
//  Created by 이창준 on 9/30/23.
//

import UIKit

import ComposerKit

struct HomeCellModel: Hashable {
    let number: Int
}

final class HomeCell: UICollectionViewCell {
    
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
    
    func bind(_ model: HomeCellModel) {
        self.label.text = String(model.number)
        self.backgroundColor = HomeCell.randomColors.randomElement()
    }
    
}
