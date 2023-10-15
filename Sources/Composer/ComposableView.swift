//
//  ComposableView.swift
//  ComposerKit
//
//  Created by 이창준 on 9/29/23.
//

/// > Important:
/// > You should call ``assign(composer:)`` to apply prepared ``composer``.
@MainActor
public protocol ComposableView: AnyObject {
    associatedtype Composer: ComposerKit.Composer
    
    var composer: Composer? { get set }
    
    /// This is the ideal location to include tasks that should be executed immediately
    /// after defining the `composer`.
    ///
    /// In this example, we're creating a `Combine` stream to apply
    /// `ViewController`'s `data` property to Composer's `dataSource` snapshot:
    /// ```swift
    /// func bind(composer: DashboardComposer) {
    ///   self.$data
    ///     .sink { datas in
    ///         // apply new snapshot using datas to dataSource.
    ///         composer.bind(datas)
    ///     }
    ///     .store(in: &cancellables)
    /// }
    /// ```
    ///
    /// This function allows you to bind the `composer` and manage data flow effectively.
    func bind(composer: Composer)
}

public extension ComposableView {
    
    func assign(composer: Composer?) {
        if let composer {
            self.bind(composer: composer)
            composer.play()
        }
    }
    
    func bind(composer: Composer) { }
    
}
