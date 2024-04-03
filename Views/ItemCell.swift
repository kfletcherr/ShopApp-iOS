//
//  ItemCell.swift
//  ShopApp
//
//  Created by Kyle Fletcher on 3/6/24.
//

import SwiftUI

struct ItemCell: View {
    let item: Item

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
            }
            Spacer()
            Text("$\(item.price, specifier: "%.2f")")
                .font(.subheadline)
        }
    }
}

//
//#Preview {
//    ItemCell()
//}
