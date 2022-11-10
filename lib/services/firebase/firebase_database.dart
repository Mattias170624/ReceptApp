import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  Future<void> testPost() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('users');

    await userRef.add({'123': '123'});
  }
}
