import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var quantity: Int
    var price: Double
}

struct CartView: View {
    var items: [CartItem] = [
        CartItem(name: "Apple", quantity: 2, price: 0.99),
        CartItem(name: "Bread", quantity: 1, price: 2.99),
        CartItem(name: "Cheese", quantity: 1, price: 5.49),
    ]
    
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Qty: \(item.quantity)")
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Text("Total: $\(totalPrice, specifier: "%.2f")")
                            .bold()
                    }
                }
                
                // Checkout button
                Button(action: {
                    // Action for the checkout process
                    print("Checkout tapped")
                }) {
                    Text("Checkout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Shopping Cart")
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
