//
//  ComposeModel.swift
//
//  Composer
//  Created by 이창준 on 9/25/23.
//

public protocol ComposeModel {
    var item: UICollectionViewComposeLayout.Item { get }
    var group: UICollectionViewComposeLayout.Group { get }
    var section: UICollectionViewComposeLayout.Section { get }
}
