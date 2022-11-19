// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grupp_project/services/firebase/firebase_database.dart';

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
      backgroundColor: Colors.black,
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
      body: foodInfo(),
    );
  }

  Widget foodInfo() {
    return SingleChildScrollView(
      // add image, name, description, ingredients, instructions and a favorite button
      // call a function for each detail
      child: Column(
        children: [
          foodImage(),
          favoriteButton(),
          foodName(),
          foodDescription(),
          foodIngredients(),
          foodInstructions(),
        ],
      ),
    );
  }

  foodImage() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('${widget.foodMap!['image']}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  foodName() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.foodMap!['name']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  foodDescription() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Description',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.foodMap!['description']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  foodIngredients() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Ingredients',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.foodMap!['ingredients']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  foodInstructions() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Instructions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.foodMap!['instructions']}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  favoriteButton() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              // if pressed color is red, if not pressed color is white
              color: widget.foodMap!['isFav'] ? Colors.red : Colors.white,
            ),
            onPressed: () async {
              Icon(
                Icons.favorite,
                color: Colors.white,
              );
              // submit to itemFavorite() in firebase_database.dart
              try {
                await FirebaseDatabase().itemFavorite(
                    '${widget.foodMap!['name']}',
                    '${widget.foodMap!['description']}',
                    '${widget.foodMap!['image']}',
                    '${widget.foodMap!['category']}',
                    '${widget.foodMap!['ingridients']}',
                    '${widget.foodMap!['instructions']}');
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
