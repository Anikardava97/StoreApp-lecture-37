//
//  CategoryCardView.swift
//  StoreApp
//
//  Created by Ani's Mac on 18.12.23.
//

import SwiftUI

struct CategoryCardView: View {
    
    // MARK: - Properties
    var category: String
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            categoryIcon(category)
            
            Text(category.capitalized)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 80)
        .padding(.horizontal, 24)
        .background(Color(red: 26/255, green: 26/255, blue: 26/255))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
    // MARK: - Properties
    private func categoryIcon(_ category: String) -> Image {
        switch category {
        case "fragrances":
            return Image("fragrance")
        case "home-decoration":
            return Image("grocery")
        case "groceries":
            return Image("home")
        case "laptops":
            return Image("laptop")
        case "skincare":
            return Image("skin")
        case "smartphones":
            return Image("phone")
        default:
            return Image("defaultIcon")
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(MainViewModel())
}


