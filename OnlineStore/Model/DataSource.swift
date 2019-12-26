//
//  DataSource.swift
//  OnlineStore
//
//  Created by Denis Zayakin on 12/7/19.
//  Copyright © 2019 Denis Zayakin. All rights reserved.
//

import Foundation

struct Product {
    let name: String
//    let category: String
//    let subcategory: String
//    let price: Int
}

class DataSource {
    static var shared = DataSource()
    
    var category: [[String]] = [ ["Category 1", "Subcategory 1", "Subcategory 2", "Subcategory 3", "Subcategory 4"], ["Category 2", "Subcategory 1", "Subcategory 2", "Subcategory 3", "Subcategory 4"], ["Category 3", "Subcategory 1", "Subcategory 2", "Subcategory 3", "Subcategory 4"] ]
    var arrFilter: [String] = []
    var products: [Product] = [Product(name: "Product 1"), Product(name: "Product 2"), Product(name: "Product 3"), Product(name: "Product 4"), Product(name: "Product 5"), Product(name: "Product 6")]
    var picker = ["red", "green", "yellow", "blue"]
    var cart: [Product] = []
    
    func addToCart(product: Product) {
        cart.append(product)
    }
}
