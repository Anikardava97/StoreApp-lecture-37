//
//  TabBarItem.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

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
        case .home: return Color(hue: 1.0, saturation: 0.89, brightness: 0.835)
        case .categories: return Color(hue: 1.0, saturation: 0.89, brightness: 0.835)
        }
    }
}

