//
//  CartButtonComponentView.swift
//  StoreApp
//
//  Created by Ani's Mac on 18.12.23.
//

import SwiftUI

struct CartButtonComponentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart")
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .padding(.top, 5)
                
                if viewModel.cart.count > 0 {
                    Text("\(viewModel.cart.count)")
                        .font(.caption2).bold()
                        .foregroundStyle(.white)
                        .frame(width: 15, height: 15)
                        .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .cornerRadius(50)
                }
            }
            if viewModel.cart.count > 0 {
                Text("\(viewModel.purchaseAmount)$")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 60, height: 60)
    }
}

#Preview {
    CartButtonComponentView()
        .environmentObject(MainViewModel())
}
