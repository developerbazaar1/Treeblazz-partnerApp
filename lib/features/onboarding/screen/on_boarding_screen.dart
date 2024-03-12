import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/controllers/onboarding_controller.dart';
import 'package:tb_patner/features/onboarding/widgets/on_boarding_dot_navigation.dart';

import '../../../res/comman/my_text.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageUpdateIndicator,
            children: const [
              OnboradingScreen(
                image: "assets/img/splash01.png",
                title: "Welcome",
                subtitle:
                    "Cillum ullamco dolor Lorem laboris aliqua adipisicing duis qui anim adipisicing elit officia.",
              ),
              OnboradingScreen(
                image: "assets/img/splash02.png",
                title: "Welcome",
                subtitle:
                    "Cillum ullamco dolor Lorem laboris aliqua adipisicing duis qui anim adipisicing elit officia.",
              ),
              OnboradingScreen(
                image: "assets/img/splash01.png",
                title: "Welcome",
                subtitle:
                    "Cillum ullamco dolor Lorem laboris aliqua adipisicing duis qui anim adipisicing elit officia.",
              ),
            ],
          ),
          Positioned(
            bottom: height * 0.05,
            child: const OnBoradingDotNavigation(),
          ),
          Obx(
            () => Positioned(
              top: 50,
              right: 15,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/signin"),
                child: MyTextPoppines(
                  text: controller.currentIndex.value != 2 ? "Skip" : "Next",
                  color: Colors.black,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnboradingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnboradingScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.12),
              SizedBox(
                width: width,
                height: height * 0.5,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              MyTextSansPro(
                text: title,
                fontSize: width * 0.09,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.01),
              MyTextPoppines(
                text: subtitle,
                fontSize: width * 0.035,
                color: Colors.black.withOpacity(0.4),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
