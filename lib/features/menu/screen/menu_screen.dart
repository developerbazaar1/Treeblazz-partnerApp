import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_text.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Menu"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: width * 0.04,
            mainAxisSpacing: height * 0.015,
            //  childAspectRatio: height * 0.0016,
          ),
          itemBuilder: (context, index) {
            return MenuCategoriesContainer(
              title: "title",
              img: AppImages.organicCBDFlower,
              boxColor: AppColor.hd_lightBlue,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class MenuCategoriesContainer extends StatelessWidget {
  final String title;
  final String img;
  final Color boxColor;
  final VoidCallback onTap;
  const MenuCategoriesContainer({
    super.key,
    required this.title,
    required this.img,
    required this.boxColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          color: boxColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
                horizontal: width * 0.03,
              ),
              child: SizedBox(
                width: width * 0.3,
                child: MyTextPoppines(
                  text: title,
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              width: width,
              height: height * 0.13,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
