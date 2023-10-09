//
//  ComposeLayoutBuilder.swift
//  ComposerKit
//
//  Created by 이창준 on 9/26/23.
//

typealias LayoutBuilder = ComposeLayoutBuilder<ComposeSection>

@resultBuilder
public struct ComposeLayoutBuilder<Material> {
    
    public static func buildBlock(_ components: [Material?]...) -> [Material] {
        return components.flatMap { $0 }.compactMap { $0 }
    }
    
    public static func buildArray(_ components: [[Material?]]) -> [Material] {
        return components.flatMap { $0 }.compactMap { $0 }
    }
    
    public static func buildExpression(_ expression: Material?) -> [Material] {
        return expression == nil ? [] : [expression!]
    }
    
    public static func buildEither(first component: [Material?]) -> [Material] {
        return component.compactMap { $0 }
    }
    
    public static func buildEither(second component: [Material?]) -> [Material] {
        return component.compactMap { $0 }
    }
    
    public static func buildOptional(_ component: [Material]?) -> [Material] {
        return component ?? []
    }
    
}
