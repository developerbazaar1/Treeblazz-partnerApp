import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/controllers/order_controller.dart';
import 'package:tb_patner/features/products/widgets/search_textfeild.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/utils/enum.dart';
import 'package:tb_patner/utils/utils.dart';

import '../widget/order_card_widget.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController.instance;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SearchTextFeild(controller: controller)),
                SizedBox(width: width * 0.03),
                const FilterOrderButton(),
              ],
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: RefreshIndicator(
                color: Colors.black,
                backgroundColor: AppColor.lightPink,
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  orderController.refreshOrders();
                },
                child: Obx(
                  () => ListView.builder(
                    itemCount: orderController.filteredOrders.length,
                    itemBuilder: (context, index) {
                      final orders = orderController.filteredOrders;
                      final order = orders[index];
                      return OrdersCard(order: order);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOrderButton extends StatelessWidget {
  const FilterOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;
    return PopupMenuButton(
      icon: CircleAvatar(
        radius: width * 0.06,
        backgroundColor: const Color.fromARGB(255, 244, 245, 247),
        child: const Icon(
          Iconsax.filter,
          color: AppColor.redColor,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          for (var status in OrderStatus.values)
            PopupMenuItem(
              value: status,
              child: Text(Utils.getOrderStatusString(status)),
            ),
        ];
      },
      onSelected: (value) {
        if (value == 'clear') {
          orderController.clearFilter();
        } else {
          orderController.filterOrders(value as OrderStatus);
        }
      },
    );
  }
}
