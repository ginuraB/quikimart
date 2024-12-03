import 'package:flutter/material.dart';
import 'product_list_screen.dart';  // Import Product List Screen

class HomeScreen extends StatelessWidget {
  final Map<String, List<String>> categories = {
    'Diary Products': ['Milk', 'Cheese', 'Butter', 'Yogurt'],
    'Vegetables': ['Carrot', 'Broccoli', 'Spinach', 'Cabbage'],
    'Bakery Items': ['Bread', 'Croissants', 'Muffins', 'Bagels'],
    'Meat Items': ['Chicken', 'Pork', 'Beef', 'Lamb'],
    'Pantry & Staples': ['Rice', 'Pasta', 'Flour', 'Sugar'],
    'Beverages': ['Juice', 'Soda', 'Coffee', 'Tea'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickMart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: categories.keys.length, // Dynamically adjust based on categories
              itemBuilder: (context, index) {
                String categoryName = categories.keys.elementAt(index);

                return GestureDetector(
                  onTap: () {
                    // Navigate to Product List Screen with category data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListScreen(
                          categoryName: categoryName,
                          products: categories[categoryName]!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Center(
                      child: Text(categoryName),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
