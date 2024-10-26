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
    {
      "category": "Kids",
      "subcategories": [
        {
          "name": "Boys",
          "imageUrl":
              "https://images.unsplash.com/photo-1604924617861-1f6b9c006750"
        },
        {
          "name": "Girls",
          "imageUrl":
              "https://images.unsplash.com/photo-1603415526960-f0b8b201bf33"
        },
        {
          "name": "Toys",
          "imageUrl":
              "https://images.unsplash.com/photo-1549924231-f129b911e442"
        },
        {
          "name": "Clothing",
          "imageUrl":
              "https://images.unsplash.com/photo-1518888905879-d9c5d9b0f871"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1598133894009-0c86e0d20800"
    },
    {
      "category": "Mobile",
      "subcategories": [
        {
          "name": "Smartphones",
          "imageUrl":
              "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9"
        },
        {
          "name": "Accessories",
          "imageUrl":
              "https://images.unsplash.com/photo-1598327102325-fec12a1575c8"
        },
        {
          "name": "Tablets",
          "imageUrl":
              "https://images.unsplash.com/photo-1581579185760-392f942b60d2"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1561154464-d1133824d497"
    },
    {
      "category": "Electronics",
      "subcategories": [
        {
          "name": "Laptops",
          "imageUrl":
              "https://images.unsplash.com/photo-1517336714731-489689fd1ca8"
        },
        {
          "name": "Cameras",
          "imageUrl":
              "https://images.unsplash.com/photo-1519183071298-a2962e4a2448"
        },
        {
          "name": "Accessories",
          "imageUrl":
              "https://images.unsplash.com/photo-1600331984287-3e4e4e16fc31"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1593642634315-48f5414c3ad9"
    },
    {
      "category": "Women",
      "subcategories": [
        {
          "name": "Upper wear",
          "imageUrl":
              "https://images.unsplash.com/photo-1531902453781-a4c50bfe5f24"
        },
        {
          "name": "Lower wear",
          "imageUrl":
              "https://images.unsplash.com/photo-1560807707-8cc77767d783"
        },
        {
          "name": "Beauty Product",
          "imageUrl":
              "https://images.unsplash.com/photo-1522336572468-8b7f71e52732"
        },
        {
          "name": "Inner wear",
          "imageUrl":
              "https://images.unsplash.com/photo-1592878849129-f55b38c262e3"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1519882180494-77cd4d30aa0d"
    },
    {
      "category": "Men",
      "subcategories": [
        {
          "name": "Shirts",
          "imageUrl":
              "https://images.unsplash.com/photo-1583228242-96f67e32b396"
        },
        {
          "name": "Pants",
          "imageUrl":
              "https://images.unsplash.com/photo-1588392382834-a891154bca4d"
        },
        {
          "name": "Accessories",
          "imageUrl":
              "https://images.unsplash.com/photo-1517260739337-3a6cfa3f76c2"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1524253482453-3fed8d2fe12b"
    },
    {
      "category": "Decor",
      "subcategories": [
        {
          "name": "Wall Art",
          "imageUrl":
              "https://images.unsplash.com/photo-1579888613761-f315f8d3f7f1"
        },
        {
          "name": "Lighting",
          "imageUrl":
              "https://images.unsplash.com/photo-1519710164239-da123dc03ef4"
        },
        {
          "name": "Furniture",
          "imageUrl":
              "https://images.unsplash.com/photo-1560185127-6f28dc2b7e43"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1519710164239-da123dc03ef4"
    },
    {
      "category": "Furniture",
      "subcategories": [
        {
          "name": "Sofas",
          "imageUrl":
              "https://images.unsplash.com/photo-1560448071-32f681f2022b"
        },
        {
          "name": "Tables",
          "imageUrl":
              "https://images.unsplash.com/photo-1519710164239-da123dc03ef4"
        },
        {
          "name": "Chairs",
          "imageUrl":
              "https://images.unsplash.com/photo-1524758631624-e2822e304c36"
        },
      ],
      "imageUrl": "https://images.unsplash.com/photo-1600585154340-be6161b3e59b"
    },
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
          Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
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
                            ? Colors.white
                            : Colors.grey[100],
                        border: Border(
                          left: BorderSide(
                            color: index == _selectedCategoryIndex
                                ? Color(0xFF8034DA)
                                : Colors.transparent,
                            width: 6,
                          ),
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                categorizedItems[index]["imageUrl"]),
                          ),
                          SizedBox(height: 8),
                          Text(
                            categorizedItems[index]["category"],
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 18 / 12,
                              color: index == _selectedCategoryIndex
                                  ? Colors.black
                                  : Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(Colors.black26),
                thickness: MaterialStateProperty.all(4),
                radius: Radius.circular(4),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          categorizedItems[_selectedCategoryIndex]["category"],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 10.0),
                            child: Divider(
                              color: Colors.black26,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var subcategory
                      in categorizedItems[_selectedCategoryIndex]
                          ["subcategories"])
                    CategorySection(
                      subcategory: subcategory,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final Map<String, dynamic> subcategory;

  CategorySection({required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subcategory['name'], // Access subcategory name here
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.29,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.network(
                            subcategory["imageUrl"], // Use subcategory's image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 67.98,
                        height: 21.24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 0.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Fusion Wear',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.8,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

