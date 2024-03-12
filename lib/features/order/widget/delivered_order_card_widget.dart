import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';

class DeliveredOrderCard extends StatelessWidget {
  final String orderId;
  final VoidCallback onTap;
  const DeliveredOrderCard({
    super.key,
    required this.orderId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => context.pushNamedRoute('/orderDetaile'),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.015),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          border: Border.all(
            color: AppColor.greyColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSansPro(
                  text: "Order #$orderId",
                  fontSize: width * 0.045,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.01),
                SizedBox(
                  width: width * 0.7,
                  child: MyTextSansPro(
                    text: "Jhon Doe had delivered this Order",
                    fontSize: width * 0.036,
                    color: AppColor.textDarkBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(width * 0.016),
                      decoration: BoxDecoration(
                        color: AppColor.greyColor.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(width * 0.01),
                      ),
                      child: Icon(
                        Icons.phone,
                        color: AppColor.redColor,
                        size: width * 0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    MyTextPoppines(
                      text: "+91 53258298",
                      fontSize: width * 0.038,
                      color: AppColor.redColor,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                CupertinoIcons.chevron_right,
                size: width * 0.06,
              ),
            )
          ],
        ),
      ),
    );
  }
}
