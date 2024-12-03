import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  // Sample cart data, in a real app, this would come from a state management solution or database.
  final List<CartItem> cartItems = [
    CartItem(name: 'Apple', price: 1.5, quantity: 2),
    CartItem(name: 'Banana', price: 0.8, quantity: 3),
    CartItem(name: 'Milk', price: 2.0, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Price: \$${item.price} x ${item.quantity}'),
                  trailing: Text('\$${item.totalPrice.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement checkout or payment process here
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Proceeding to Checkout')));
              },
              child: Text('Proceed to Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
