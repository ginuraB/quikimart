import 'package:flutter/material.dart';
import 'cart_item.dart'; // Import CartItem model
import 'cart_state.dart'; // Import global cart
import 'cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId; // Product ID to identify the product

  ProductDetailsScreen({required this.productId});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productName = 'Product ${widget.productId + 1}'; // Example product name
    final productPrice = (widget.productId + 1) * 5.0; // Example price calculation
    final productDescription = 'Description of product ${widget.productId + 1}';

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              productDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '\$$productPrice',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add the product to the cart
                final cartItem = CartItem(
                  name: productName,
                  price: productPrice,
                  quantity: 1,
                );

                // Check if the item is already in the cart
                bool itemExists = false;
                for (var item in globalCart) {
                  if (item.name == cartItem.name) {
                    itemExists = true;
                    break;
                  }
                }

                if (!itemExists) {
                  setState(() {
                    globalCart.add(cartItem); // Add item to the global cart
                  });
                }

                // Navigate to Cart Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
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
