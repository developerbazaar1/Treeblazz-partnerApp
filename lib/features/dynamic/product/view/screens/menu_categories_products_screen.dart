import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/notification/screen/notification_screen.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
import 'package:tb_patner/res/constants/app_images.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_text.dart';

class MenuCategoriesProductsScreen extends StatelessWidget {
  final String? prodcutName;
  static const String routeName = '/menuCategoriesProducts';
  const MenuCategoriesProductsScreen({super.key, this.prodcutName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: prodcutName ?? "Menu Categories Products"),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const MenuProductsCard();
        },
      ),
    );
  }
}

class MenuProductsCard extends StatelessWidget {
  const MenuProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        margin: EdgeInsets.symmetric(
          vertical: height * 0.008,
          horizontal: width * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          border: Border.all(
            color: AppColor.containerGreyBorder,
          ),
          color: AppColor.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.28,
              height: height * 0.14,
              child: Image.asset(
                AppImages.organicCBDFlower,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: height * 0.018),
                  MyTextSansPro(
                    text: "Flower",
                    fontSize: width * 0.036,
                    color: AppColor.redColor,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: height * 0.003),
                  MyTextSansPro(
                    text: "Organic CBD Flower",
                    fontSize: width * 0.04,
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: height * 0.01),
                  MyTextPoppines(
                    text: "\$50",
                    fontSize: width * 0.06,
                    color: AppColor.redColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyTextSansPro(
                        text: "Quantity : 1kg",
                        fontSize: width * 0.035,
                        color: AppColor.textDarkBlue,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          MyTextSansPro(
                            text: "Stock In",
                            fontSize: width * 0.035,
                            color: AppColor.textDarkBlue,
                            fontWeight: FontWeight.w600,
                          ),
                          Transform.scale(
                            scale: 0.60,
                            child: const SwtichButton(),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
