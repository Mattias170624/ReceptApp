// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:grupp_project/widgets/homeScreenImage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _getFoodCategoryNames = [
    'Meat',
    'Soup',
    'Pasta',
    'Taco',
    'Pizza',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeScreenGradient(),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: List.generate(6, (index) {
                      return GestureDetector(
                        onTap: () => _handleCategoryClick(index),
                        child: Container(
                          padding: EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xDDDDDDDD),
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Image(
                                  image: _getCategoryImages(index),
                                  height: 100.0,
                                  width: 100.0,
                                ),
                              ),
                              Text(
                                _getFoodCategoryNames[index],
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCategoryClick(int categoryIndex) {
    print(categoryIndex);
    // send user to $index page, and show list of $index type foods
  }

  AssetImage _getCategoryImages(int categoryIndex) {
    final List<String> foodImageRefs = [
      'assets/images/steak.png',
      'assets/images/soup.png',
      'assets/images/pasta.png',
      'assets/images/tacos.png',
      'assets/images/pizza.png',
      'assets/images/dessert.png',
    ];

    return AssetImage(foodImageRefs[categoryIndex]);
  }
}
