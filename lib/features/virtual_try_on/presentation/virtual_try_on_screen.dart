import 'package:flutter/material.dart';

class VirtualTryOnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('虚拟试衣'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            color: Colors.grey[200],
            child: Center(child: Text('虚拟试衣区域')),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 试穿上衣
                },
                child: Text('上衣'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 试穿裤子
                },
                child: Text('裤子'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 试穿鞋子
                },
                child: Text('鞋子'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
