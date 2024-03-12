import 'package:flutter/material.dart';
import 'package:tb_patner/features/order/widget/delivered_order_card_widget.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class DeliveredOrdersScreen extends StatelessWidget {
  static const String routeName = '/deliveredOrders';
  const DeliveredOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Delivered Orders"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.045),
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
