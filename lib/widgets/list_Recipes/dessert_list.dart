import 'package:flutter/material.dart';


class Dessert_List extends StatefulWidget {
  const Dessert_List ({Key? key}) : super(key: key);

  @override
  State<Dessert_List> createState() => _Dessert_ListState();
}

class _Dessert_ListState extends State<Dessert_List> {

  final List<Map> myProducts =
  List.generate(5, (index) => {"id": index, "name": "Dessert $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(title: const Text("Dessert meals"),
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