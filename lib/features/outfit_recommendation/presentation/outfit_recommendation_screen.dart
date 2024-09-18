import 'package:flutter/material.dart';

class OutfitRecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搭配推荐'),
      ),
      body: ListView(
        children: [
          _buildOutfitCard(),
          _buildOutfitCard(),
          _buildOutfitCard(),
        ],
      ),
    );
  }

  Widget _buildOutfitCard() {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/clothes/top.png', width: 100, height: 100),
              Image.asset('assets/clothes/pants.png', width: 100, height: 100),
              Image.asset('assets/clothes/shoes.png', width: 100, height: 100),
            ],
          ),
          Text('今日推荐', style: TextStyle(fontSize: 16)),
          ElevatedButton(
            onPressed: () {
              // 进入详情页面
            },
            child: Text('查看详情'),
          ),
        ],
      ),
    );
  }
}
