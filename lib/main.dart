import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/controllers/add_product_controller.dart';
import 'package:tb_patner/controllers/order_controller.dart';
import 'package:tb_patner/controllers/products_controller.dart';
import 'package:tb_patner/features/onboarding/screen/on_boarding_screen.dart';
import 'package:tb_patner/features/products/screens/menu_categories_products_screen.dart';
import 'package:tb_patner/features/splash/screens/splash_intro_screen.dart';
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
      initialBinding: InitialBinding(),
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

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(OrderController());
    Get.put(AddProductController());
  }
}
