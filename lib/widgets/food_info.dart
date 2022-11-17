// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FoodInfo extends StatefulWidget {
  Map? foodMap;

  FoodInfo(this.foodMap);

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          '${widget.foodMap!['name']}',
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
      body: Center(
        child: Column(
          children: [
            Text('description: ${widget.foodMap!['description']}'),
            Text('instructions: ${widget.foodMap!['instructions']}'),
            Text('ingredients: ${widget.foodMap!['ingredients']}'),
          ],
        ),
      ),
    );
  }
}
