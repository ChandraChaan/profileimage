import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ImagePicker _picker = ImagePicker();

  XFile image;

  void getimage() async {

   final XFile newimage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {image = newimage;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          getimage();
        },
        child: Container(
          child: Center(child: image !=null ? Image.file(File(image.path)) : Icon(Icons.import_contacts_sharp)),
        ),
      ),
    );
  }
}
