//
//  CustomTabBarContainerView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)

        }
            .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
                self.tabs = value
            }
    }
}

let tab: [TabBarItem] = [.home, .categories, .products, .productDetails]

#Preview {
    CustomTabBarContainerView(selection: .constant(tab.first!)) {
        Color.red
    }
}
