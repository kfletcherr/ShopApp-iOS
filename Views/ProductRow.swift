//
//  ProductRow.swift
//  ShopApp
//
//  Created by Kyle Fletcher on 3/6/24.
//

import SwiftUI

struct ProductRow: View {
    var name: String
    var description: String
    var price: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .bold()
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(price)
                .font(.subheadline)
        }
    }
}

#Preview {
    ProductRow(name: "Playstation 5", description: "A game console", price: "$200.99")
}
