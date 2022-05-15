//
//  PositionCell.swift
//  PizzaShop
//
//  Created by Mac on 12.04.2022.
//

import SwiftUI

struct PositionCell: View {
    let position: Position
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) штук")
            Text("\(position.cost) ₸")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal )
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id:                                                          UUID().uuidString,
                                                           title: "Маргарита",
                                                           imageUrl: "pizza1",
                                                           price: 450,
                                                           descript: "njnfj"),
                                        count: 3))
    }
}
