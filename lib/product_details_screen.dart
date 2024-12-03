import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'cart_item.dart'; // Import your CartItem model (if you haven't already)

class ProductDetailsScreen extends StatelessWidget {
  final int productId; // To receive product ID

  // Constructor to receive productId
  ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    // Example cartItems list for this screen
    List<CartItem> cartItems = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Product ${productId + 1}', // Displaying product based on ID
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description of product ${productId + 1}', // Simple description
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '\$${(productId + 1) * 5}', // Product price (can be replaced with real data)
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart (example)
                cartItems.add(CartItem(name: 'Product ${productId + 1}', price: (productId + 1) * 5, quantity: 1));

                // Navigate to Cart Screen and pass cartItems
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems), // Pass cartItems here
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
