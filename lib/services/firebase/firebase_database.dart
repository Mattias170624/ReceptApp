import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grupp_project/Models/item_model.dart';

class FirebaseDatabase {
  // Single reference to database instance
  FirebaseFirestore database = FirebaseFirestore.instance;

  Future<void> testPost() async {
    CollectionReference userRef = database.collection('users');

    await userRef.add({'123': '123'});
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
