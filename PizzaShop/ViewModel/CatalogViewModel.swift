//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by Mac on 11.04.2022.
//

import Foundation

class CatalogViewModel: ObservableObject {
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 450,
                descript: "Самая дешевая пицца"),
        Product(id: "2",
                title: "Пеперонни",
                imageUrl: "Not found",
                price: 500,
                descript: "Самая дешевая пицца"),
        Product(id: "3",
                title: "4 сыра",
                imageUrl: "Not found",
                price: 550,
                descript: "Самая дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 400,
                descript: "Самая дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 620,
                descript: "Самая дешевая пицца")
    ]
    
    var pizzas = [
        Product(id: "1",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 450,
                descript: "Самая дешевая пицца"),
        Product(id: "2",
                title: "Пеперонни",
                imageUrl: "Not found",
                price: 500,
                descript: "Самая дешевая пицца"),
        Product(id: "3",
                title: "4 сыра",
                imageUrl: "Not found",
                price: 550,
                descript: "Самая дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 400,
                descript: "Самая дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 620,
                descript: "Самая дешевая пицца")
    ]
    
}
