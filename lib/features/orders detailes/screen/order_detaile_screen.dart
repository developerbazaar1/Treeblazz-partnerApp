import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tb_patner/res/comman/my_redbutton.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/features/order/screen/order_screen.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class OrderDetaileScreen extends StatelessWidget {
  static const String routeName = '/orderDetaile';
  const OrderDetaileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Order Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.45,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 2,
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
              const OrderBillingCard(),
              SizedBox(height: height * 0.035),
              MyTextSansPro(
                text: "Order Details",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              const OrderDetailsCard(),
              SizedBox(height: height * 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Cancle",
                    fontSize: width * 0.048,
                    hspacing: width * 0.13,
                    vspacing: height * 0.016,
                    buttonColor: AppColor.black,
                    onTap: () {},
                  ),
                  CustomButton(
                    text: "Confrim",
                    fontSize: width * 0.048,
                    hspacing: width * 0.13,
                    vspacing: height * 0.016,
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(height: height * 0.035),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderBillingCard extends StatelessWidget {
  const OrderBillingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
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
            children: [
              buildDetailes(context, "Sub Total", "320", false),
              buildDetailes(context, "Tax", "0", false),
              buildDetailes(context, "Delivery Charge", "50", false),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          padding: EdgeInsets.only(
            top: height * 0.022,
            bottom: height * 0.012,
            right: width * 0.04,
            left: width * 0.04,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.015),
            color: AppColor.greyColor.withOpacity(0.4),
          ),
          child: buildDetailes(
            context,
            "Total Paid",
            "370",
            true,
          ),
        ),
      ],
    );
  }

  Widget buildDetailes(
    BuildContext context,
    String title,
    String price,
    bool? isTotal,
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
            text: "\$$price.0",
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: isTotal ?? false ? AppColor.redColor : AppColor.greyColor,
          ),
        ],
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

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
          buildDetailes(context, "Order Number", "#534345"),
          buildDetailes(context, "Placed Date", "30 Dec 24"),
          buildDetailes(context, "Payment Mode", "COD"),
          SizedBox(height: height * 0.005),
          MyTextSansPro(
            text: "Delivery Address",
            fontSize: width * 0.046,
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
