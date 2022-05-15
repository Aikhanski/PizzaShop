//
//  ProductCell.swift
//  PizzaShop
//
//  Created by Mac on 11.04.2022.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
       
        VStack(spacing: 2) {
            Image("pizza1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                //.cornerRadius(16)
            
            HStack{
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 14))
                Spacer()
                Text("\(product.price) ₸")
                    .font(.custom("AvenirNext-bold", size: 14))
                
            }.padding(.horizontal, 4)
                .padding(.bottom, 6)
        }.frame(width: screen.width * 0.45, height: screen.height * 0.3)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 5)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                  title: "Маргарита",
                                  imageUrl: "Not found",
                                  price: 450,
                                  descript: "Самая дешевая пицца"))
    }
}
