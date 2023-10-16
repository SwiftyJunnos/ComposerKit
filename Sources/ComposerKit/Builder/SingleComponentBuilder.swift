//
//  SingleComponentBuilder.swift
//  ComposerKit
//
//  Created by 이창준 on 10/14/23.
//

/// ``NSCollectionLayoutSection`` can only have single group.
/// Thus, ``GroupBuilder`` returns a single ``ComposeGroup`` instead of Array unlike ``ComposeItem`` and ``ComposeSection``.
@resultBuilder
public struct SingleComponentBuilder {
    
    public static func buildBlock(_ components: ComposeGroup...) -> ComposeGroup {
        guard let group = components.first else {
            fatalError("Section can have only one group.")
        }
        return group
    }
    
    public static func buildFinalResult(_ component: ComposeGroup) -> ComposeGroup {
        return component
    }
    
    public static func buildOptional(_ component: [ComposeGroup]?) -> [ComposeGroup] {
        return component ?? []
    }
    
    public static func buildEither(first component: ComposeGroup) -> ComposeGroup {
        return component
    }
    
    public static func buildEither(second component: ComposeGroup) -> ComposeGroup {
        return component
    }
    
}
