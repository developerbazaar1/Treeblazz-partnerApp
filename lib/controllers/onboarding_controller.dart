import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/features/home/screens/home_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
  // Varibales
  final PageController pageController = PageController();
  Rx<int> currentIndex = 0.obs;

  // Update Current Page When page Scroll
  void onPageUpdateIndicator(index) {
    currentIndex.value = index;
  }

  // Jump to specific dot selected Page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index and jump to next page
  void nextPage() {
    if (currentIndex.value == 2) {
      Get.to(const HomeScreen());
    }
  }

  // Update current index and jump to last Page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
