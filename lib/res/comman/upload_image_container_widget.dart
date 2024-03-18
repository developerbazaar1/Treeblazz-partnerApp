import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/res/constants/app_colors.dart';

class AddImageContainer extends StatelessWidget {
  final String text;
  final String note;
  final VoidCallback onTap;
  const AddImageContainer({
    super.key,
    required this.onTap,
    required this.text,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(width * 0.04),
          color: AppColor.greyColor,
          dashPattern: const [8, 4],
          strokeWidth: 2,
          child: Container(
            width: width - width * 0.11,
            padding: EdgeInsets.symmetric(vertical: height * 0.06),
            decoration: BoxDecoration(
              color: AppColor.containerGreyBg,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    Iconsax.gallery_add_copy,
                    size: width * 0.06,
                    color: AppColor.redColor,
                  ),
                ),
                SizedBox(height: height * 0.01),
                MyTextPoppines(
                  text: text,
                  fontSize: width * 0.038,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.015),
        MyTextSansPro(
          text: note,
          fontSize: width * 0.035,
          color: AppColor.greyColor,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
