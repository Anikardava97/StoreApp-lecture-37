//
//  TitleDescriptionComponentView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct TitleDescriptionComponentView: View {
    
    var title: String
    var titleFont: CGFloat
    var titleWeight: Font.Weight
    var description: String
    var descriptionFont: CGFloat
    var descriptionWeight : Font.Weight
    var price: Int
    var priceFont: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: titleFont, weight: titleWeight))
                .foregroundStyle(Color.black)
            Text(description)
                .font(.system(size: descriptionFont, weight: descriptionWeight))
                .foregroundStyle(Color.black.opacity(0.6))
            
            Text("$\(price)")
                .font(.system(size: titleFont, weight: titleWeight))
                .foregroundStyle(.black)
        }
        .padding(.leading, 12)
        .padding(.vertical, 12)
        .frame(width: 150)
        .background(.white)
        .lineLimit(1)
    }
}

#Preview {
    TitleDescriptionComponentView(title: "Test", titleFont: 16, titleWeight: .bold, description: "Test", descriptionFont: 14, descriptionWeight: .medium, price: 12, priceFont: 18)
}
