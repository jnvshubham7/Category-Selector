import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategorySelector(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> categorizedItems = [
    {"category": "Kids", "subcategories": ["Boys", "Girls", "Toys", "Clothing"]},
    {"category": "Mobile", "subcategories": ["Smartphones", "Accessories", "Tablets"]},
    {"category": "Electronics", "subcategories": ["Laptops", "Cameras", "Accessories"]},
    {"category": "Women", "subcategories": ["Upper wear", "Lower wear", "Beauty Product", "Inner wear"]},
    {"category": "Men", "subcategories": ["Shirts", "Pants", "Accessories"]},
    {"category": "Decor", "subcategories": ["Wall Art", "Lighting", "Furniture"]},
    {"category": "Furniture", "subcategories": ["Sofas", "Tables", "Chairs"]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Drawer for Category List
          Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: ListView.builder(
              itemCount: categorizedItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: index == _selectedCategoryIndex
                          ? Colors.grey[100]
                          : Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: index == _selectedCategoryIndex
                              ? Colors.blue // Customize border color for selection
                              : Colors.transparent,
                          width: 4,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon.png'), // Replace with category-specific icon
                        ),
                        SizedBox(height: 8),
                        Text(
                          categorizedItems[index]["category"],
                          style: TextStyle(
                            fontWeight: index == _selectedCategoryIndex
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: index == _selectedCategoryIndex
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Main Content Area
          Expanded(
            child: ListView(
              children: [
                for (String subcategory
                    in categorizedItems[_selectedCategoryIndex]["subcategories"])
                  CategorySection(subcategory: subcategory),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String subcategory;

  CategorySection({required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subcategory,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.75,
            ),
            itemCount: 6, // Number of items in each subcategory
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.asset(
                          'assets/image.png', // Replace with actual image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product Name', // Replace with actual product name
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
