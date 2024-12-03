import 'package:flutter/material.dart';
import 'cart_item.dart'; // Import Cart Item Model
import 'cart_state.dart'; // Import global cart list

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = globalCart.fold(0.0, (sum, item) => sum + item.totalPrice);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: globalCart.length,
              itemBuilder: (context, index) {
                final item = globalCart[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Price: \$${item.price} x ${item.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            } else {
                              globalCart.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text('\$${item.totalPrice.toStringAsFixed(2)}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
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
