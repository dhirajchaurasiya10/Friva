import 'package:flutter/material.dart';
import 'package:friva/pages/game_page.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Architects Daughter',
        scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0,),
      ),
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }

}

