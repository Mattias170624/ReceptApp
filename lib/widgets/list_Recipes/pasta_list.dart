import 'package:flutter/material.dart';


class Pasta_List extends StatefulWidget {
  const Pasta_List ({Key? key}) : super(key: key);

  @override
  State<Pasta_List> createState() => _Pasta_ListState();
}

class _Pasta_ListState extends State<Pasta_List> {

  final List<Map> myProducts =
  List.generate(5, (index) => {"id": index, "name": "Pasta $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    return Scaffold(
        appBar: AppBar(title: const Text("Pasta meals"),
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
