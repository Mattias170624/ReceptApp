// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/food_info.dart';
import 'package:flutter/material.dart';

import 'category_gradient.dart';

class FoodList extends StatefulWidget {
  final int? index;
  final String? categoryName;

  FoodList(this.index, String this.categoryName);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          '${widget.categoryName}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: foodList(),
    );
  }

  Widget foodList() {
    return FutureBuilder(
      future: FirebaseDatabase().fetchAllFoods(),
      builder: (context, foodArray) {
        if (foodArray.hasData) {
          final data = foodArray.data as Map;
          List<Map<dynamic, dynamic>> foodMap = [];

          for (var item in data.values) {
            if (item.containsValue(widget.categoryName)) {
              foodMap.add(item);
            }
          }

          return ListView.builder(
            itemCount: foodMap.length,
            padding: EdgeInsets.only(top: 5.0),
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
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '${foodMap[index]['image']}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodMap[index]['name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            foodMap[index]['description'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
