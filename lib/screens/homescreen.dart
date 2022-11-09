// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            padding: EdgeInsets.all(25.0),
            children: List.generate(6, (index) {
              return Container(
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
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
                    Text(_getFoodCategoryNames[index]),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  final List<String> _getFoodCategoryNames = [
    'Chinese',
    'Italian',
    'Mexican',
    'Thai',
    'Dessert',
    'Drink',
  ];

  AssetImage _getCategoryImages(int index) {
    final List<String> foodImageRefs = [
      'assets/images/steak.png',
      'assets/images/soup.png',
      'assets/images/pasta.png',
      'assets/images/tacos.png',
      'assets/images/pizza.png',
      'assets/images/dessert.png',
    ];

    return AssetImage(foodImageRefs[index]);
  }
}
