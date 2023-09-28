//
//  ComposeModel.swift
//  Composer
//
//  Created by 이창준 on 9/25/23.
//

public protocol ComposeModel {
    var item: ComposeItem { get }
    var group: ComposeGroup { get }
    var section: ComposeSection { get }
}
