import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/delivered_order_card_widget.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class DeliveredOrdersScreen extends StatelessWidget {
  static const String routeName = '/deliveredOrders';
  const DeliveredOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: const MyAppBar(text: "Delivered Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return DeliveredOrderCard(
              orderId: "8428489",
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
