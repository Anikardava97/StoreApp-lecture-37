//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    let product: Product
    @Binding var path: NavigationPath
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CustomBackButton(presentationMode: presentationMode, foregroundColor: .black)
            titleView
            imageView
            descriptionView
            priceAndStockView
            returnButton
            Spacer()
        }
        .background()
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
    }
    
    // MARK: - Content
    private var titleView: some View {
        Text(product.title.capitalized)
            .font(.system(size: 20, weight: .medium))
            .frame(maxWidth: .infinity)
    }
    
    private var imageView: some View {
        AsyncImage(url: URL(string: product.thumbnail)) { image in
            image.resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(height: 300)
        } placeholder: {
            RoundedRectangle(cornerRadius: 16)
                .frame(height: 300)
                .background(Color.gray)
        }
    }
    private var descriptionView: some View {
        Text(product.description)
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(.black.opacity(0.6))
    }
    
    private var discountPercentage: some View {
        Text(String(format: "-%.f%%", product.discountPercentage))
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
    }
    
    private var priceView: some View {
        Text("$\(product.price)")
            .font(.system(size: 32, weight: .bold))
    }
    
    private var stockView: some View {
        Text("Only \(product.stock) left in stock - order soon".capitalized)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
    }
    
    private var priceAndStockView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                discountPercentage
                priceView
            }
            stockView
        }
    }
    
    // MARK: - Return Button
    private var returnButton: some View {
        Button(action: {
            path.removeLast(path.count)
        }, label: {
            Text("Return to Categories")
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color(red: 26/255, green: 26/255, blue: 26/255))
                .foregroundStyle(.white)
                .cornerRadius(8)
        })
    }
}

#Preview {
    ProductDetailView(product: Product(id: 1, title: "Test", description: "Test", price: 12, discountPercentage: 23.0, rating: 23.0, stock: 2, brand: "Test", category: "Test", thumbnail: "thumbnail", images: ["Test"]), path: CategoriesView().$path)
}
