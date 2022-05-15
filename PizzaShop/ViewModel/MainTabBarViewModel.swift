//
//  MainTabBarViewModel.swift
//  PizzaShop
//
//  Created by Mac on 13.04.2022.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
