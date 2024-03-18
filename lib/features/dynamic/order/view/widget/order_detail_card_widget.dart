import 'package:flutter/material.dart';
import 'package:tb_patner/data/models/order.dart';
import 'package:tb_patner/utils/utils.dart';

import '../../../../../res/constants/app_colors.dart';
import '../../../../../res/comman/my_text.dart';

class OrderDetailsCard extends StatelessWidget {
  final Orders order;
  const OrderDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.019,
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.015),
        border: Border.all(
          color: AppColor.greyColor.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailes(context, "Order Number", "#${order.id}"),
          buildDetailes(context, "Placed Date", order.date),
          buildDetailes(
            context,
            "Payment Mode",
            Utils.getPaymentModeString(order.paymentMode),
          ),
          SizedBox(height: height * 0.005),
          MyTextSansPro(
            text: "Delivery Address",
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: height * 0.012),
          MyTextSansPro(
            text: "94, 100ft Ring Rd, Vysya Bank Colony, B T M",
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: AppColor.greyColor,
          ),
        ],
      ),
    );
  }

  Widget buildDetailes(
    BuildContext context,
    String title,
    String price,
  ) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextSansPro(
            text: title,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
          ),
          MyTextPoppines(
            text: price,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: AppColor.greyColor,
          ),
        ],
      ),
    );
  }
}
