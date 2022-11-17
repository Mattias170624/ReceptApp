// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/food_info.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${foodMap[index]['name']}',
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '${foodMap[index]['description']}',
                        ),
                      ],
                    ),
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
