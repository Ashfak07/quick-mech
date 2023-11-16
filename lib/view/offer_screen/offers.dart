import 'package:flutter/material.dart';

class offerscreen extends StatefulWidget {
  const offerscreen({super.key});

  @override
  State<offerscreen> createState() => _offerscreenState();
}

class _offerscreenState extends State<offerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(132, 31, 142, 221),
        title: Text("TOP DEALS"),actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),
           ),
           IconButton(onPressed: (){}, icon: Icon(Icons.trolley))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 200,width: double.infinity,color: Colors.amber,
              ),
              SizedBox(height: 20),
              Container(height: 150,
                child: GridView.builder(scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1), itemBuilder: (context, index) => 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 20,width: 20,color:Colors.blue,),

                    ),
                    ),
                    
              ),
              SizedBox(height: 20,),
              Container(height: 250,
                child: GridView.builder(scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2), itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Colors.blue,),
                    ) ,),
              )

          ],
          
        ),
          

        );  }
}