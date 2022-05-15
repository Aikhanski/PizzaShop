//
//  Position.swift
//  PizzaShop
//
//  Created by Mac on 12.04.2022.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
