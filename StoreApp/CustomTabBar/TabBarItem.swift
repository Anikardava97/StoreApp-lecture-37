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
    case home, categories, products, productDetails
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .categories: return "list.bullet.rectangle.portrait"
        case .products: return "macbook.and.iphone"
        case .productDetails: return "doc.text.magnifyingglass"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .categories: return "Categories"
        case .products: return "Products"
        case .productDetails: return "Details"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.black
        case .categories: return Color.black
        case .products: return Color.black
        case .productDetails: return Color.black
        }
    }
}

