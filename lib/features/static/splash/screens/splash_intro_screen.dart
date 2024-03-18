import 'dart:async';

import 'package:flutter/material.dart';

class SplashIntroScreen extends StatefulWidget {
  const SplashIntroScreen({super.key});

  @override
  State<SplashIntroScreen> createState() => _SplashIntroScreenState();
}

class _SplashIntroScreenState extends State<SplashIntroScreen> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    if (_isFirstTime) {
      _startTimer();
    }
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushNamed("/splash");
      setState(() {
        _isFirstTime = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
