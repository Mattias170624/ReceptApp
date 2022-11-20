import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grupp_project/Models/item_model.dart';

class FirebaseDatabase {
  // Single reference to database instance
  FirebaseFirestore database = FirebaseFirestore.instance;
  static var listOfFoods = {};
  static var listOfFavouriteFoods = {};

  Future<Map?> fetchAllFoods([bool updateFoodList = false]) async {
    if (updateFoodList == true) {
      listOfFoods.clear();
    } else {
      if (listOfFoods.isNotEmpty) return listOfFoods;
    }

    print('Reading db');
    final docRef = database.collection('items').doc('allFoods');
    try {
      docRef.get().then((value) {
        value.get('foodArray');
        if (value.data() == null) return;

        // Converting value.data() type to normal maps
        final array = value.data()!.values;

        for (var element in array) {
          listOfFoods.addAll(element.asMap());
        }
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Map?> fetchFavFoods([bool updateFoodList = false]) async {
    if (updateFoodList == true) {
      listOfFavouriteFoods.clear();
    } else {
      if (listOfFavouriteFoods.isNotEmpty) return listOfFavouriteFoods;
    }

    print('Reading db');
    final docRef = database.collection('items').doc('favoriteFoods');
    try {
      docRef.get().then((value) {
        value.get('favoriteFoods');
        if (value.data() == null) return;
        print('${value.data()}');

        // Converting value.data() type to normal maps
        final array = value.data()!.values;

        for (var element in array) {
          listOfFavouriteFoods.addAll(element.asMap());
        }
      });
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<void> itemsPost(
      name, description, image, category, ingredients, instructions) async {
    final docItem = database.collection('items').doc('allFoods');

    final item = ItemModel(
      id: docItem.id,
      name: name,
      description: description,
      image: image,
      category: category,
      ingredients: ingredients,
      instructions: instructions,
    );

    final itemJson = item.toJson();

    await docItem.set({
      'foodArray': FieldValue.arrayUnion([itemJson]),
    }, SetOptions(merge: true));
  }

  Future<void> itemFavorite(
    name,
    description,
    image,
    category,
    ingredients,
    instructions,
  ) async {
    final docItem = database.collection('items').doc('favoriteFoods');

    final item = ItemModel(
      id: docItem.id,
      name: name,
      description: description,
      image: image,
      category: category,
      ingredients: ingredients,
      instructions: instructions,
      isFav: true,
    );

    final itemJson = item.toJson();

    await docItem.set({
      'favoriteFoods': FieldValue.arrayUnion([itemJson]),
    }, SetOptions(merge: true));
    await fetchFavFoods(true);
  }
}
