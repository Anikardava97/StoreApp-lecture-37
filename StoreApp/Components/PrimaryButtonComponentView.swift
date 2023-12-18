//
//  PrimaryButtonComponentView.swift
//  StoreApp
//
//  Created by Ani's Mac on 18.12.23.
//

import SwiftUI

struct PrimaryButtonComponentView: View {
    var action: () -> Void
    var icon: String
    var text: String

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                
                Text(text.capitalized)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            .frame(width: 160)
            .frame(height: 56)
            .background(.black)
            .cornerRadius(8)
        }
    }
}
