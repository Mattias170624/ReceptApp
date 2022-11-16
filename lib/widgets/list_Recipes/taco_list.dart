import 'package:flutter/material.dart';


class Taco_List extends StatefulWidget {
  const Taco_List ({Key? key}) : super(key: key);

  @override
  State<Taco_List> createState() => _Taco_ListState();
}

class _Taco_ListState extends State<Taco_List> {

  final List<Map> myProducts =
  List.generate(5, (index) => {"id": index, "name": "Taco $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(title: const Text("Taco meals"),
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