//
//  MainTabBar.swift
//  PizzaShop
//
//  Created by Mac on 08.04.2022.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
       
        TabView {
            
            NavigationView{
                CatalogView()
            }
            
                .tabItem {
                    VStack {
                        Image(systemName: "menucard")
                        Text("Каталог")
                    }
                }
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            ProfileView(viewModel: ProfileViewModel(profile: MyUser(id: "", name: "", phone: 7072202175, address: "")))
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
        }
        
    }
}

