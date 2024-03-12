import 'package:flutter/cupertino.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Order"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: ListView.builder(
          itemCount: AppList.dashboardOrder.length,
          itemBuilder: (context, index) {
            final order = AppList.dummyOrders[index];
            return OrdersCard(
              orderId: order.id,
              price: order.price,
              date: order.date,
              time: order.time,
            );
          },
        ),
      ),
    );
  }
}

class OrdersCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String time;
  final String price;
  const OrdersCard({
    super.key,
    required this.price,
    required this.orderId,
    required this.date,
    required this.time,
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
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          color: AppColor.containerGreyBg,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.3,
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
                MyTextPoppines(
                  text: price,
                  fontSize: width * 0.05,
                  color: AppColor.redColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.012),
                Row(
                  children: [
                    Icon(
                      Iconsax.calendar_2_copy,
                      size: width * 0.04,
                      color: AppColor.redColor,
                    ),
                    SizedBox(width: width * 0.014),
                    MyTextPoppines(
                      text: date,
                      fontSize: width * 0.032,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: width * 0.04),
                    Icon(
                      Iconsax.clock_copy,
                      size: width * 0.04,
                      color: AppColor.redColor,
                    ),
                    SizedBox(width: width * 0.014),
                    MyTextPoppines(
                      text: time,
                      fontSize: width * 0.032,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.016),
                MyTextSansPro(
                  text: "Cash On Delivery",
                  fontSize: width * 0.04,
                  color: AppColor.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
