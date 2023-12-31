//
//  TabBarItem.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

enum TabBarItem: Hashable {
    case home, categories
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .categories: return "macbook.and.iphone"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .categories: return "Categories"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color(.black)
        case .categories: return Color(.black)
        }
    }
}

