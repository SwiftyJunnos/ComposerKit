//
//  ComposableView.swift
//  ComposerKit
//
//  Created by 이창준 on 9/29/23.
//

@MainActor
public protocol ComposableView: AnyObject {
    associatedtype Composer: ComposerKit.Composer
    
    var composer: Composer? { get set }
    
    func bind(composer: Composer)
}

public extension ComposableView {
    
    var composer: Composer? {
        get {
            return composer
        }
        set {
            if let composer = newValue {
                bind(composer: composer)
                composer.build()
            }
        }
    }
    
    func bind(composer: Composer) { }
    
}
