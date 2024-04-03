//
//  ContentView.swift
//  ShopApp
//
//  Created by Kyle Fletcher on 3/6/24.
//

import SwiftUI

// Define your Item model
//struct Item: Identifiable {
//    let id = UUID()
//    let name: String
//    let description: String
//    let price: Double
//}

// The detail view for displaying an item's name and description
struct ItemDetailView: View {
    let item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(item.name)
                .font(.largeTitle)
            Text(item.description)
                .font(.body)
            Text("Price: $\(item.price, specifier: "%.2f")") // Displaying the price
                .font(.title)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("Item Details"), displayMode: .inline)
    }
}

// ContentView with a list of items, each item navigates to the ItemDetailView on tap
struct ContentView: View {
    let items: [Item] = [
        Item(name: "Playstation 5", description: "A game console", price: 200.99),
        Item(name: "Hammer", description: "A very useful tool, is good for hammering things.", price: 1.99),
        Item(name: "Macbook Pro", description: "An overpriced laptop, pretty neat for coding though", price: 2001.99),
        Item(name: "iPad", description: "Pretty nice tablet, can be used as a second screen", price: 999.99),
        Item(name: "iPhone", description: "Small iPad, can be used for calling people", price: 632.66),
        Item(name: "Screwdriver", description: "We don't screw around with this one", price: 5.99),
        Item(name: "Shoes", description: "Used for wearing", price: 10.99),
        Item(name: "Xbox Series X", description: "Another game console", price: 2000.99)
    ]

    // State to manage the presentation of the ShoppingCartView
        @State private var showingCart = false

        var body: some View {
            NavigationView {
                List(items) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name).font(.headline)
                            }
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                        .padding()
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Start Shopping!", displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    // Toggle the state to show the cart
                    showingCart.toggle()
                }) {
                    Image(systemName: "cart").imageScale(.large)
                })
                // Present the ShoppingCartView
                .sheet(isPresented: $showingCart) {
                    CartView()
                }
            }
        }
    }

// SwiftUI Preview for development
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
