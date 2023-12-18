//
//  ProductCardComponentView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct ProductCardComponentView: View {
    // MARK: - Components
    @EnvironmentObject var viewModel: MainViewModel
    var  product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                productImageView
                productInfoStack
            }
            .frame(width: 150, alignment: .leading)
            .cornerRadius(8)
            .shadow(radius: 3)
            
            addButton
        }
    }
    
    private var addButton: some View {
        Button {
            viewModel.addToCart(product: product)
        } label: {
            Image(systemName: "plus")
                .frame(width: 16, height: 16)
                .padding(8)
                .foregroundStyle(.white)
                .background(.black.opacity(0.8))
                .cornerRadius(50)
                .padding(8)
        }
    }
    // MARK: - ImageView
    private var productImageView: some View {
        AsyncImage(url: URL(string: product.thumbnail)) { image in
            image.resizable()
                .frame(height: 100)
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
    
    //MARK: - Product Info
    private var productInfoStack: some View {
        TitleDescriptionComponentView(
            title: product.title,
            titleFont: 12,
            titleWeight: .bold,
            description: product.description,
            descriptionFont: 10,
            descriptionWeight: .medium,
            price: product.price,
            priceFont: 14
        )
    }
}

#Preview {
    ProductCardComponentView(product: Product(id: 1, title: "Test", description: "Test", price: 12, discountPercentage: 23.0, rating: 23.0, stock: 2, brand: "Test", category: "Test", thumbnail: "Test", images: ["Test"]))
}
