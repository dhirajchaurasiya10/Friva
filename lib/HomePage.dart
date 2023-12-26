import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: Container(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This should Give TITLE"),
            SizedBox(height: 25,),
          Center(child: ElevatedButton(onPressed: (){}, child: Icon(Icons.high_quality),)),

          ],
        ),
      ),),
    );
  }
}