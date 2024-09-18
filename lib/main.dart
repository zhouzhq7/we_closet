import 'package:flutter/material.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/wardrobe/presentation/wardrobe_screen.dart';
import 'features/wardrobe/presentation/add_clothing_item_screen.dart';
import 'features/outfit_recommendation/presentation/outfit_recommendation_screen.dart';
import 'features/virtual_try_on/presentation/virtual_try_on_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '衣物搭配APP',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/wardrobe': (context) => WardrobeScreen(),
        '/add_clothing': (context) => AddClothingItemScreen(),
        '/recommendations': (context) => OutfitRecommendationScreen(),
        '/virtual_try_on': (context) => VirtualTryOnScreen(),
      },
    );
  }
}
