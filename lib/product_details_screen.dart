import 'package:flutter/material.dart';
import 'cartscreen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId; // To receive product ID

  // Constructor to receive productId
  ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
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
                // Navigate to Cart Screen when "Add to Cart" is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
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
