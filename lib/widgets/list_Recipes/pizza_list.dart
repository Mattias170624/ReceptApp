import 'package:flutter/material.dart';


class Pizza_List extends StatefulWidget {
  const Pizza_List ({Key? key}) : super(key: key);

  @override
  State<Pizza_List> createState() => _Pizza_ListState();
}

class _Pizza_ListState extends State<Pizza_List> {

  final List<Map> myProducts =
  List.generate(5, (index) => {"id": index, "name": "Pizza $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(title: const Text("Pizza meals"),
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