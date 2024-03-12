import 'package:flutter/material.dart';

class MySnackBar {
  static void show(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
