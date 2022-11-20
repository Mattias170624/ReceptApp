// ignore_for_file: prefer_const_constructors

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/category_gradient.dart';
import 'package:grupp_project/widgets/food_info.dart';
import 'package:flutter/material.dart';

class FavoriteList extends StatefulWidget {
  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
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
                    'Favorite recipes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                foodList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget foodList() {
    return FutureBuilder(
      future: FirebaseDatabase().fetchFavFoods(),
      builder: (context, foodArray) {
        if (foodArray.hasData) {
          final data = foodArray.data as Map;
          List<Map<dynamic, dynamic>> foodMap = [];

          for (var item in data.values) {
            foodMap.add(item);
          }

          return Expanded(
            child: ListView.builder(
              itemCount: foodMap.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodInfo(foodMap[index]),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
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
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${foodMap[index]['image']}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 35.0,
                              color: Colors.black54,
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${foodMap[index]['name']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
