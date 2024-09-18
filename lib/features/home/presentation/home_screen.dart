import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('衣物搭配APP'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // 用户个人资料按钮
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('每日推荐', style: Theme.of(context).textTheme.titleLarge),
          ),
          // 示例图片卡片
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text('今日推荐穿搭', style: TextStyle(fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('快捷操作', style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              children: [
                _buildFeatureCard(
                  context,
                  title: '管理衣柜',
                  icon: Icons.category,
                  onTap: () => Navigator.pushNamed(context, '/wardrobe'),
                ),
                _buildFeatureCard(
                  context,
                  title: '搭配推荐',
                  icon: Icons.style,
                  onTap: () => Navigator.pushNamed(context, '/recommendations'),
                ),
                _buildFeatureCard(
                  context,
                  title: '虚拟试衣',
                  icon: Icons.camera,
                  onTap: () => Navigator.pushNamed(context, '/virtual_try_on'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '衣柜'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心'),
        ],
        onTap: (index) {
          // 导航切换逻辑
        },
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
