import 'package:flutter/material.dart';
import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/list_Recipes/meat_list.dart';
import 'package:grupp_project/widgets/create_recipe.dart';
import 'package:grupp_project/services/firebase/firebase_database.dart';

class Meat_List extends StatefulWidget {
   Meat_List({Key? key}) : super(key: key);


  @override
  State<Meat_List> createState() => _Meat_ListState();
}

class _Meat_ListState extends State<Meat_List> {

  final List<Map> myProducts =
  List.generate(5, (index) => {"id": index, "name": "Recept $index",})
      .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(title: const Text("Meat meals"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder
          (gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 420,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15)),
              child: Text(
                myProducts[index]["name"]
              ),
              );
            }),
        )
    );
  }
}
