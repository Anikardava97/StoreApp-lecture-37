//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI


struct CategoriesView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.uniqueCategories, id: \.self) { category in
                NavigationLink(value: category) {
                    CategoryCardView(category: category)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
            .navigationDestination(for: String.self) { category in
                ProductsView(category: category, path: $path)
            }
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(MainViewModel())
}


