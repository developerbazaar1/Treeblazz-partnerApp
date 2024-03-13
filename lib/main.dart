import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/features/products/screens/menu_categories_products_screen.dart';
import 'package:tb_patner/res/comman/app_buttomBar.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/routing/router.dart';

void main() {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppBottomBar(),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
