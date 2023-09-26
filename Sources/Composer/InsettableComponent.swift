//
//  InsettableComponent.swift
//
//  Composer
//  Created by 이창준 on 9/26/23.
//

import UIKit

public protocol InsettableComponent {
    func contentInsets(equalEdges inset: CGFloat) -> Self
    func contentInsets(horizontal: CGFloat, vertical: CGFloat) -> Self
    func contentInsets(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Self
}

public extension InsettableComponent {
    func contentInsets(equalEdges inset: CGFloat) -> Self {
        return self.contentInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    func contentInsets(horizontal: CGFloat, vertical: CGFloat) -> Self {
        return self.contentInsets(top: horizontal, leading: vertical, bottom: horizontal, trailing: vertical)
    }
}
