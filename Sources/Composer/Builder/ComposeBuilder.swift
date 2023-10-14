//
//  ComposeBuilder.swift
//  ComposerKit
//
//  Created by 이창준 on 10/14/23.
//

typealias SectionBuilder = ComposeBuilder<ComposeSection>
typealias ItemBuilder = ComposeBuilder<ComposeItem>

@resultBuilder
public struct ComposeBuilder<ComposeComponent> {
    
    public static func buildBlock(_ components: ComposeComponent...) -> [ComposeComponent] {
        return components.map { $0 }
    }
    
    public static func buildFinalResult(_ component: [ComposeComponent]) -> [ComposeComponent] {
        return component
    }
    
    public static func buildOptional(_ component: [ComposeComponent]?) -> [ComposeComponent] {
        return component ?? []
    }
    
    public static func buildEither(first component: [ComposeComponent]) -> [ComposeComponent] {
        return component
    }
    
    public static func buildEither(second component: [ComposeComponent]) -> [ComposeComponent] {
        return component
    }
    
    public static func buildArray(_ components: [[ComposeComponent]]) -> [ComposeComponent] {
        return components.flatMap { $0 }
    }
    
}
