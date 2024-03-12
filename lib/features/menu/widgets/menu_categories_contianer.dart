import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_text.dart';

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
                width: width * 0.4,
                child: MyTextPoppines(
                  text: title,
                  fontSize: width * 0.042,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width * 0.02),
                    bottomLeft: Radius.circular(width * 0.02),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.burgerBanner),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
