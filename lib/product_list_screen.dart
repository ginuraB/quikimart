import 'package:flutter/material.dart';
import 'product_details_screen.dart'; // Import Product Details Screen

class ProductListScreen extends StatelessWidget {
  final String categoryName;
  final List<String> products;

  // Constructor to accept category name and products
  ProductListScreen({required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
      ),
      body: ListView.builder(
        itemCount: products.length, // Show products of the selected category
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to Product Details Screen with product data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(productId: index),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(products[index]),
                subtitle: Text('Description of ${products[index]}'),
                trailing: Text('\$${(index + 1) * 5}'), // Example price
              ),
            ),
          );
        },
      ),
    );
  }
}
