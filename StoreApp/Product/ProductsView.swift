//
//  ProductsView.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

struct ProductsView: View {
    // MARK: - Properties
    let category: String
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode
    private let spacing: CGFloat = 24
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            headerView
            balanceView
            categoryName
            verticalScrollView
        }
        .background(Color(red: 26/255, green: 26/255, blue: 26/255))
        .navigationBarBackButtonHidden()
    }
    
    //MARK: - Products Grid
    private var customBackButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            customBackButton
            Spacer()
            CartButtonComponentView()
        }
        .padding(.horizontal, 24)
    }
    
    private var balanceView: some View {
        HStack {
            VStack(spacing: 4) {
                balanceInfo
                viewModel.totalBalance()
            }
            Spacer()
            primaryButton
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(.white)
        .cornerRadius(12)
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
    }
    
    private var balanceInfo: some View {
        HStack {
            HStack {
                Image("wallet")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.black.opacity(0.8))
                    .frame(width: 20, height: 20)
                
                Text("Total Balance:".uppercased())
                    .font(.system(size: 12))
                    .foregroundStyle(.black)
            }
        }
    }
    
    private var verticalScrollView: some View {
        ScrollView {
            productGrid
        }
        .background(Color(red: 26/255, green: 26/255, blue: 26/255))
    }
    
    private var categoryName: some View {
        Text(category.capitalized)
            .foregroundStyle(.white)
            .font(.title2)
            .padding()
    }
    
    private var productGrid: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(viewModel.products.filter { $0.category == category }) { product in
                ProductCardComponentView(product: product)
            }
        }
        .padding(.horizontal, 24)
        .background(Color(red: 26/255, green: 26/255, blue: 26/255))
    }
    
    private var primaryButton: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                PrimaryButtonComponentView(action: {
                    viewModel.checkout()
                }, icon: ("checkout"), text: "Checkout")
            }
        }
        .alert(item: $viewModel.alertType) { alertType in
            switch alertType {
            case .success:
                return Alert(
                    title: Text("Success 🥳"),
                    message: Text("Purchase Successful!"),
                    dismissButton: .default(Text("OK"))
                )
            case .error:
                return Alert(
                    title: Text("Insufficient Funds 🙁"),
                    message: Text("Please, add more money to your balance"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    ProductsView(category: "groceries")
    .environmentObject(MainViewModel())
}

