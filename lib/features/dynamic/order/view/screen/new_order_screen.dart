import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/order/controller/order_controller.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/order_card_widget.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/utils/enum.dart';

class NewOrderScreen extends StatelessWidget {
  static const String routeName = '/newOrder';
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    final orderController = OrderController.instance;
    final newOrders = orderController.filteredOrders
        .where((order) => order.status == OrderStatus.received)
        .toList();
    return Scaffold(
      appBar: const MyAppBar(text: "New Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: ListView.builder(
          itemCount: newOrders.length,
          itemBuilder: (context, index) {
            final order = newOrders[index];
            return OrdersCard(order: order);
          },
        ),
      ),
    );
  }
}
