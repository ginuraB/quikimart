import 'package:flutter/material.dart';

class PaymentFailureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Failed')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 100, color: Colors.red),
            SizedBox(height: 20),
            Text(
              'Payment Failed. Please try again.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
