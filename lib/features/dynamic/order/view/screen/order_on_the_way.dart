import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/order/controller/order_controller.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/order_card_widget.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/utils/enum.dart';

class OrderOnTheWayScreen extends StatelessWidget {
  static const String routeName = '/orderOnTheWay';
  const OrderOnTheWayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;
    final onTheWayOrders = orderController.filteredOrders
        .where((order) => order.status == OrderStatus.outForDelivery)
        .toList();
    return Scaffold(
      appBar: const MyAppBar(text: "Orders On The Way"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: ListView.builder(
          itemCount: onTheWayOrders.length,
          itemBuilder: (context, index) {
            final order = onTheWayOrders[index];
            return OrdersCard(order: order);
          },
        ),
      ),
    );
  }
}
