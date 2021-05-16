import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 0,
      title: Text(
        'Book viewer v1',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
