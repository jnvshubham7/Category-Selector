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

  final List<String> categories = [
    "Kids",
    "Mobile",
    "Electronics",
    "Women",
    "Men",
    "Decor",
    "Furniture"
  ];

  final Map<String, List<String>> subcategories = {
    "Women": ["Upper wear", "Lower wear", "Beauty Product", "Inner wear"],
    // Add more categories and their subcategories as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
        ),
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
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection:
                  Axis.vertical, // Make ListView scroll horizontally
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },

                  child: Container(
                    color: index == _selectedCategoryIndex
                        ? Colors.grey[200]
                        : Colors.white,
                    padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        // Replace this with category-specific icons
                        backgroundImage: AssetImage(
                            'assets/${categories[index].toLowerCase()}.png'),
                      ),
                      SizedBox(
                          height:
                              8), // Add spacing between the icon and the text
                      Text(categories[index]),
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
                    in subcategories[categories[_selectedCategoryIndex]] ?? [])
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
                elevation: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/sample_product.png', // Replace with actual image path
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Product Name', // Replace with actual product name
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
