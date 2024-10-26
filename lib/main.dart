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
          // margin: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Image.asset('assets/back.png', width: 32, height: 32),
            onPressed: () {},
            // splashRadius: 10,
            tooltip: 'Go back',
          ),
        ),
        title: Text(
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
            color: Colors.grey.shade300, // Light grey color for divider
            height: 1, // Divider thickness
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 8.0),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F7FE),

                    // add shsow in right side
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],

                    // border: Border(
                    //   right: BorderSide(color: Colors.grey[300]!, width: 1),
                    // ),
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
                              // selcted color white
                              // unslected color background: #F8F7FE;
                              color: index == _selectedCategoryIndex
                                  ? Colors.white
                                  : Color(0xFFF8F7FE),

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

                              // add shadow right side
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  // backgroundColor: Color(0xFFE5E5E5),
                                  backgroundImage: AssetImage(

                                      // 'assets/kids.png',
                                      categorizedItems[index]["icon"]),
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
                          //
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                categorizedItems[_selectedCategoryIndex]
                                    ["category"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 10.0),
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subcategory,
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
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
