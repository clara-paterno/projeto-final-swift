//
//  TabbedItems.swift
//  projeto_final
//
//  Created by Turma02-19 on 11/11/25.
//

import Foundation


enum TabbedItems: Int, CaseIterable{
    case home = 0
    case add
    case menu
    
    
    var title: String{
        switch self {
        case .home:
            return "plants"
        case .add:
            return ""
        case .menu:
            return "config"
            
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "leaf"
        case .add:
            return ""
        case .menu:
            return "list.star"
            
        }
    }
}
