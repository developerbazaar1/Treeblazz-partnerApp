import 'package:flutter/cupertino.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/app_images.dart';
import '../../../res/comman/my_text.dart';

class PickupOrderCard extends StatelessWidget {
  final String orderId;
  final VoidCallback onTap;
  const PickupOrderCard({
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
        margin: EdgeInsets.symmetric(vertical: height * 0.01),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          border: Border.all(
            color: AppColor.greyColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.25,
              height: height * 0.1,
              child: Image.asset(
                AppImages.organicCBDFlower,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: width * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSansPro(
                  text: "Order #$orderId",
                  fontSize: width * 0.045,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.012),
                SizedBox(
                  width: width * 0.45,
                  child: MyTextSansPro(
                    text: "Driver will be assigned soon for this order",
                    fontSize: width * 0.038,
                    color: AppColor.textDarkBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(width: width * 0.04),
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
