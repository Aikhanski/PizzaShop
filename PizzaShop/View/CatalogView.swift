//
//  Catalog.swift
//  PizzaShop
//
//  Created by Mac on 08.04.2022.
//

import SwiftUI

struct CatalogView: View {
    
    let layoutForPizza = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Популярные") {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPizza,spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id){ item in
                            NavigationLink{
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }.padding()
                }
                
            }
            
            Section("Меню") {
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForPizza,spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id){
                            item in NavigationLink{
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }.padding()
                }
                
            }
            
            
        }.navigationBarTitle(Text("Каталог"))
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
