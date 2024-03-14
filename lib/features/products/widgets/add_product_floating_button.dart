import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';

class AddProductFloatingActionButton extends StatelessWidget {
  const AddProductFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () => context.pushNamedRoute('/addProduct'),
      child: Container(
        width: width * 0.4,
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        decoration: BoxDecoration(
          color: AppColor.redColor,
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextSansPro(
              text: "Add Product",
              color: AppColor.white,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(width: width * 0.02),
            Icon(
              Iconsax.box_add_copy,
              color: AppColor.white,
              size: width * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
