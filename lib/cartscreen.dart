import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add dynamic content for the cart (for now we are showing static content)
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of products in cart (replace with dynamic data)
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Product ${index + 1}'),
                      subtitle: Text('Description of product ${index + 1}'),
                      trailing: Text('\$${(index + 1) * 5}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Total: \$25',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can add functionality for checkout here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Checkout'),
                    content: Text('Proceeding to payment'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
