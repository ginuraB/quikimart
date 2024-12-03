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

  final Map<String, String> categoryImages = {
    'Diary Products': 'assets/images/categories/diary.jpg',
    'Vegetables': 'assets/images/categories/vegi.png',
    'Bakery Items': 'assets/images/categories/bakery.jpeg',
    'Meat Items': 'assets/images/categories/meat.jpg',
    'Pantry & Staples': 'assets/images/categories/pantry&staple.jpg',
    'Beverages': 'assets/images/categories/beverages.png',
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryImages[categoryName]!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          categoryName,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
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
