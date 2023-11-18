import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
//import 'package:quickmech/utils/color_constants.dart';

class saved extends StatefulWidget {
  const saved({super.key});

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SAVED",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        forceMaterialTransparency: true,
      ),
      body: CustomFavlist(),
      // body: Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center,
      //     children: [Text("You haven't saved anything")],),
      // ),
    );
  }
}

class CustomFavlist extends StatelessWidget {
  const CustomFavlist({super.key});

  @override
  Widget build(BuildContext context) {
    var favoiuritepage = context.watch<FavouriterController>();
    return ListView.builder(
      itemCount: favoiuritepage.favitems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          child: ListTile(
            title: Text(favoiuritepage.favitems[index].name.toString()),
            leading: Container(
              width: 50,
              height: 50,
              child: Image.network(favoiuritepage.favitems[index].image),
            ),
            subtitle: Text(favoiuritepage.favitems[index].ratting),
          ),
        ),
      ),
    );
  }
}
