import 'package:flutter/material.dart';
import '../../core/models/clothing_item.dart';

class ClothingCard extends StatelessWidget {
  final ClothingItem clothingItem;

  ClothingCard({required this.clothingItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              clothingItem.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Text(clothingItem.name),
          Text(clothingItem.category),
        ],
      ),
    );
  }
}
