//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var products: [Product] = []
    @Published private(set) var cart: [Product] = []
    @Published private(set) var error: String?
    @Published private(set) var purchaseAmount: Int = 0
    @Published private(set) var userBalance: Int = 5000
    @Published private(set) var isLoading: Bool = false
    @Published var alertType: AlertType?
    
    var uniqueCategories: [String] {
        Set(products.map { $0.category }).sorted()
    }
    
    // MARK: - Init
    init() {
        fetchProducts()
    }
    
    // MARK: - Network Call
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.products = data.products
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }
    
    //MARK: - Methods
    func totalBalance() -> some View {
        return Text("\(userBalance)$")
            .font(.system(size: 24))
            .foregroundStyle(.black)
    }
    
    func addToCart(product: Product) {
        self.cart.append(product)
        self.updateTotal()
    }
    
    private func updateTotal() {
        purchaseAmount = cart.reduce(0) { $0 + $1.price }
    }
    
    func checkout() {
        if cart.isEmpty { return }
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            
            if self.userBalance >= self.purchaseAmount {
                self.userBalance -= self.purchaseAmount
                self.cart.removeAll()
                self.alertType = .success
            } else {
                self.alertType = .error
            }
        }
    }
    
    func resetPurchaseAmount() {
        purchaseAmount = 0
    }
}

