import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  static BottomBarController get instance => Get.find();

  // Variables
  Rx<int> selectedIndex = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Update the current page when Tapped
  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  // On Page Changed
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }
}
