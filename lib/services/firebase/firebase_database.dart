import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grupp_project/Models/item_model.dart';

class FirebaseDatabase {
  // Single reference to database instance
  FirebaseFirestore database = FirebaseFirestore.instance;
  static var listOfFoods = {};

  Future<Map?> fetchAllFoods() async {
    if (listOfFoods.isNotEmpty) return listOfFoods;

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
}
