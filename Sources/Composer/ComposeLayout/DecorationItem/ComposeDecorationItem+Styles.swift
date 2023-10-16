//
//  File.swift
//  
//
//  Created by 이창준 on 10/16/23.
//

import UIKit

extension ComposeDecorationItem {
    
    @frozen
    public enum Style {
        case background
        
        internal var layoutParemeters: DecorationParameters {
            switch self {
            case .background:
                return DecorationParameters(
                    style: self,
                    elementKind: "background-element-kind"
                )
            }
        }
    }
    
}
