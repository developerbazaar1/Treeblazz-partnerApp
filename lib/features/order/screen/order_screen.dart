import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/products/widgets/search_textfeild.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

import '../widget/order_card_widget.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Order"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.045),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SearchTextFeild(controller: controller)),
                SizedBox(width: width * 0.03),
                CircleAvatar(
                  radius: width * 0.06,
                  backgroundColor: const Color.fromARGB(255, 244, 245, 247),
                  child: const Icon(
                    Iconsax.filter,
                    color: AppColor.redColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
