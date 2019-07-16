import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/categories_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BragMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.blueAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)
        )
      ),
      home: CategoriesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BragMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
