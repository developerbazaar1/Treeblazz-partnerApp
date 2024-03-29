import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/res/constants/app_colors.dart';

class HomeDashboardContainers extends StatelessWidget {
  final int quantity;
  final String title;
  final Color boxColor;
  final VoidCallback onTap;
  final bool? isNewOrder;
  const HomeDashboardContainers({
    super.key,
    required this.quantity,
    required this.title,
    required this.boxColor,
    required this.onTap,
    this.isNewOrder,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
          color: boxColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextPoppines(
              text: quantity.toString(),
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: isNewOrder ?? false ? AppColor.redColor : AppColor.black,
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.3,
              child: MyTextPoppines(
                text: title,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.hd_greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
