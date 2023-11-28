import 'package:flutter/material.dart';


class CategoryWiseWorkerscreen extends StatelessWidget {
  const CategoryWiseWorkerscreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: _appBar(),
      body: GridView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            width: 50,
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}


  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              // SizedBox(
              //   height: 5,
              // ),
              _SearchBox(),
              // _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.teal.shade300,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "CATEGORY",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 70,
        )
      ],
    );
  }

  Widget _SearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "SEARCH",
          prefixIcon: Icon(Icons.search),
          labelText: "SEARCH",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
