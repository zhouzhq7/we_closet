import 'package:flutter/material.dart';
import 'features/wardrobe/presentation/wardrobe_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '衣物搭配',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: WardrobeScreen(),
    );
  }
}
