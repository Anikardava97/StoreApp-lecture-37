//
//  ProductModel.swift
//  StoreApp
//
//  Created by Ani's Mac on 17.12.23.
//

import Foundation

struct ProductsData: Decodable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Decodable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    var thumbnail: String
    let images: [String]
}
