//
//  CartViewModel.swift
//  PizzaShop
//
//  Created by Mac on 12.04.2022.
//

import Foundation

class CartViewModel: ObservableObject {
   @Published var positions = [Position]()
    
    static let shared = CartViewModel()
    
    private init() { }
    
    var cost: Int {
        var sum = 0
        for pos in positions {
            sum += pos.cost
        }
        return sum
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
