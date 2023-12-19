//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI


struct CategoriesView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            List(viewModel.uniqueCategories, id: \.self) { category in
                NavigationLink(value: category) {
                    CategoryCardView(category: category)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
            .navigationDestination(for: String.self) { category in
                ProductsView(category: category)
            }
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(MainViewModel())
}


