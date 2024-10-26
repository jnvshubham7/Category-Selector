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
        scaffoldBackgroundColor: Colors.white,
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
      "subcategories": ["Boys", "Girls", "Toys", "Clothing"],
      "icon": "assets/kids.png",
    },
    {
      "category": "Mobile",
      "subcategories": ["Smartphones", "Accessories", "Tablets"],
      "icon": "assets/phone.png",
    },
    {
      "category": "Electronics",
      "subcategories": ["Laptops", "Cameras", "Accessories"],
      "icon": "assets/headphone.png",
    },
    {
      "category": "Women",
      "subcategories": [
        "Upper wear",
        "Lower wear",
        "Beauty Product",
        "Inner wear"
      ],
      "icon": "assets/icon.png",
    },
    {
      "category": "Men",
      "subcategories": ["Shirts", "Pants", "Accessories"],
      "icon": "assets/men.png",
    },
    {
      "category": "Decor",
      "subcategories": ["Wall Art", "Lighting", "Furniture"],
      "icon": "assets/decor.png",
    },
    {
      "category": "Furniture",
      "subcategories": ["Sofas", "Tables", "Chairs"],
      "icon": "assets/furniture.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: Container(
          child: IconButton(
            icon: Image.asset('assets/back.png', width: 32, height: 32),
            onPressed: () {},
            tooltip: 'Go back',
          ),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0E0E0E),
            height: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/love.png', width: 24, height: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/cart.png', width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F7FE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 6.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
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
                                  : const Color(0xFFF8F7FE),
                              border: Border(
                                left: BorderSide(
                                  color: index == _selectedCategoryIndex
                                      ? const Color(0xFF8034DA)
                                      : Colors.transparent,
                                  width: 6,
                                ),
                                bottom: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 6.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      categorizedItems[index]["icon"]),
                                ),
                                const SizedBox(height: 8),
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
                      radius: const Radius.circular(4),
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                categorizedItems[_selectedCategoryIndex]
                                    ["category"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.black26,
                                    thickness: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        for (String subcategory
                            in categorizedItems[_selectedCategoryIndex]
                                ["subcategories"])
                          CategorySection(subcategory: subcategory),
                      ],
                    ),
                  ),
                ),
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
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
          child: Text(
            subcategory,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.29,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
          child: SizedBox(
            height: 250,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8)),
                            child: Image.asset(
                              'assets/image.png',
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
                                offset: const Offset(0, 2),
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
        ),
      ],
    );
  }
}
