import 'package:flutter/material.dart';
import 'cart_item.dart'; // Import Cart Item Model

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
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
