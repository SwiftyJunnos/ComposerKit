//
//  Struct+MutatingCopy.swift
//
//  Composer
//  Created by 이창준 on 9/27/23.
//

func mutatingCopy<T>(_ original: T, task: ((inout T) -> Void)) -> T {
    var copy = original
    task(&copy)
    return copy
}
