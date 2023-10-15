//
//  MultipleComponentsBuilder.swift
//  ComposerKit
//
//  Created by 이창준 on 10/14/23.
//

typealias SectionBuilder = MultipleComponentsBuilder<BuildableSection>
typealias ItemBuilder = MultipleComponentsBuilder<BuildableItem>

@resultBuilder
public struct MultipleComponentsBuilder<ComposeComponent> {
    
    public static func buildBlock(_ components: [ComposeComponent]...) -> [ComposeComponent] {
        return components.flatMap { $0 }
    }
    
    public static func buildFinalResult(_ component: [ComposeComponent]) -> [ComposeComponent] {
        return component
    }
    
    public static func buildExpression(_ expression: ComposeComponent) -> [ComposeComponent] {
        return [expression]
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
    
    public static func buildArray(_ components: [ComposeComponent]) -> [ComposeComponent] {
        return components
    }
    
}
