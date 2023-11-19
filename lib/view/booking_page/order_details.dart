import 'package:flutter/material.dart';

class orderdetails extends StatefulWidget {
  const orderdetails({super.key});

  @override
  State<orderdetails> createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("order ID- 00000"),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.menu),),],),
      body: Column(
        children: [
          Container(height: 420,width: double.infinity,color: Colors.black,),
         Container(
          height:300,width:double.infinity,
          child: Center(
            child: ElevatedButton(
              onPressed: (){
              showModalBottomSheet(
                context: context, builder: (BuildContext context) {
              return  Container(
                  height: double.infinity,color: Colors.white,
                  child:Container() 
                    );
              });
            }, child: Text("more details")),
          ),)
        ],
      ),
    );
    // showModalBottomSheet(context: context, builder: (context) {
    //   return Container(height: 300,color:Colors.amber ,);
    // },);
  }
}