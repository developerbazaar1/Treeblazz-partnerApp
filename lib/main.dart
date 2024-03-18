import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/features/dynamic/order/controller/order_controller.dart';
import 'package:tb_patner/features/dynamic/product/controller/add_product_controller.dart';
import 'package:tb_patner/features/dynamic/product/controller/products_controller.dart';
import 'package:tb_patner/features/static/splash/screens/splash_intro_screen.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
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
      initialBinding: InitialBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashIntroScreen(),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(OrderController());
    Get.put(AddProductController());
  }
}
