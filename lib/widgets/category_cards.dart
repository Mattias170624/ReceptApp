// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/category_gradient.dart';
import 'package:flutter/material.dart';
import 'package:grupp_project/widgets/create_recipe.dart';
import 'package:grupp_project/widgets/list_Recipes/meat_list.dart';
import 'package:grupp_project/widgets/list_Recipes/soup_list.dart';
import 'package:grupp_project/widgets/list_Recipes/pasta_list.dart';
import 'package:grupp_project/widgets/list_Recipes/taco_list.dart';
import 'package:grupp_project/widgets/list_Recipes/pizza_list.dart';
import 'package:grupp_project/widgets/list_Recipes/dessert_list.dart';

class CategoryCards extends StatelessWidget {
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
    return Stack(
      children: [
        CategoryGradient(),
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
                    'Choose a meal type',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.0,
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
                      onTap: () {
                        if (index==0) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Meat_List()));
                          _handleCategoryClick(index);
                        }
                        if(index==1) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Soup_List()));
                          _handleCategoryClick(index);
                        }
                        if(index==2) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Pasta_List()));
                          _handleCategoryClick(index);
                        }
                        if(index==3) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Taco_List()));
                          _handleCategoryClick(index);
                        }
                        if(index==4) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Pizza_List()));
                          _handleCategoryClick(index);
                        }
                        if(index==5) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Dessert_List()));
                          _handleCategoryClick(index);
                        }

                      },
                      child: Container(
                        padding: EdgeInsets.all(25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xDDDDDDDD),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 1.0),
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
                                color: Theme.of(context).colorScheme.secondary,
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
    );
  }

  void _handleCategoryClick(int categoryIndex) {
    print(categoryIndex);
    // send user to $index page, and show list of $index type foods
    FirebaseDatabase().testPost();
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
