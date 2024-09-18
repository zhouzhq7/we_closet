import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddClothingItemScreen extends StatefulWidget {
  @override
  _AddClothingItemScreenState createState() => _AddClothingItemScreenState();
}

class _AddClothingItemScreenState extends State<AddClothingItemScreen> {
  File? _image;
  final picker = ImagePicker();

  // 从相机拍照
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // 从相册选择图片
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加新衣物'),
      ),
      body: Column(
        children: [
          _image == null
              ? Text('没有选择图片')
              : Image.file(_image!, height: 200),
          ElevatedButton.icon(
            onPressed: getImageFromCamera,
            icon: Icon(Icons.camera),
            label: Text('拍照'),
          ),
          ElevatedButton.icon(
            onPressed: getImageFromGallery,
            icon: Icon(Icons.photo),
            label: Text('从相册选择'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_image != null) {
                Navigator.pop(context, _image);
              }
            },
            child: Text('保存衣物'),
          ),
        ],
      ),
    );
  }
}
