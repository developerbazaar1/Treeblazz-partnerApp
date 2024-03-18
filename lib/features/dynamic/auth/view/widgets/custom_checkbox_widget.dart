import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/res/constants/app_colors.dart';

import '../../controller/auth_controller.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final signUpContoller = AuthController.instance;

    return GestureDetector(
      onTap: () => signUpContoller.onTNCTapped(),
      child: Obx(
        () => Container(
          width: width * 0.06,
          height: height * 0.035,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: signUpContoller.isTNCAccepted
                  ? AppColor.redColor
                  : Colors.black.withOpacity(0.6), // Border color
              width: 2.0,
            ),
            color: Colors.transparent, // Fill color when checked
          ),
          child: signUpContoller.isTNCAccepted
              ? Icon(
                  Icons.check,
                  size: width * 0.045,
                  color: AppColor.redColor, // Check icon color
                )
              : null,
        ),
      ),
    );
  }
}
