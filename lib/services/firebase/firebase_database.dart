import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grupp_project/Models/item_model.dart';
import 'package:grupp_project/widgets/create_recipe.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDatabase {
  Future<void> testPost() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('users');

    await userRef.add({'123': '123'});
  }

  Future<void> itemsPost(
      name, description, image, category, ingredients, instructions) async {
    final docItem = FirebaseFirestore.instance.collection('Items').doc();

    final item = ItemModel(
        id: docItem.id,
        name: name,
        description: description,
        image: image,
        category: category,
        ingredients: ingredients,
        instructions: instructions);

    final json = item.toJson();

    await docItem.set(json);
  }
}
