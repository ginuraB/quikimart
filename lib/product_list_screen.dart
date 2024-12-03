import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Import Cart Screen
import 'product_details_screen.dart'; // Import Product Details Screen

class ProductListScreen extends StatelessWidget {
  final String categoryName;
  final List<String> products;

  // Constructor to accept category name and products
  ProductListScreen({required this.categoryName, required this.products});

  final Map<String, String> productImages = {
    'Milk': 'assets/images/products/milk.jpg',
    'Cheese': 'assets/images/products/cheese.jpg',
    'Butter': 'assets/images/products/butter.jpg',
    'Yogurt': 'assets/images/products/yoguret.jpg',
    'Carrot': 'assets/images/products/carrot.jpg',
    'Broccoli': 'assets/images/products/broccoli.jpg',
    'Spinach': 'assets/images/products/spinach.jpg',
    'Cabbage': 'assets/images/products/cabbage.png',
    'Bread': 'assets/images/products/bread.jpg',
    'Croissants': 'assets/images/products/croissants.jpg',
    'Muffins': 'assets/images/products/muffins.jpg',
    'Bagels': 'assets/images/products/bagels.jpg',
    'Chicken': 'assets/images/products/chicken.jpg',
    'Pork': 'assets/images/products/pork.jpg',
    'Beef': 'assets/images/products/beef.jpg',
    'Lamb': 'assets/images/products/lamb.jpg',
    'Rice': 'assets/images/products/rice.jpg',
    'Pasta': 'assets/images/products/pasta.jpg',
    'Flour': 'assets/images/products/flour.jpeg',
    'Sugar': 'assets/images/products/sugar.jpg',
    'Juice': 'assets/images/products/juice.jpg',
    'Soda': 'assets/images/products/soda.jpeg',
    'Coffee': 'assets/images/products/coffe.jpeg',
    'Tea': 'assets/images/products/tea.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
        actions: [
          // Cart icon with proper scaling and alignment
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to Cart screen when icon is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(cartItems: []), // Pass cartItems if needed
                    ),
                  );
                },
                iconSize: 30,  // Adjust icon size as needed
              ),
            ),
          ),
        ],
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
                leading: Image.asset(
                  productImages[products[index]]!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
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

