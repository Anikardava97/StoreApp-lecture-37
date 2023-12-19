//
//  AppTabBarView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            MainView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            CategoriesView()
                .tabBarItem(tab: .categories, selection: $tabSelection)
        }
    }
}

#Preview {
    AppTabBarView()
}

//MARK: - Default TabView

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CategoriesView()
                .tabItem {
                    Image(systemName: "macbook.and.iphone")
                    Text("Categories")
                }
        }
    }
}
