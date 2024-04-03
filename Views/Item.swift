//
//  Item.swift
//  ShopApp
//
//  Created by Kyle Fletcher on 3/6/24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var price: Double
}
