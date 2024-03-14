import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class YourScreen extends StatelessWidget {
  static const String routeName = '/Your';
  const YourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Your"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
