import 'package:flutter/material.dart';
import 'package:tb_patner/features/order/widget/pickup_order_card_widget.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

class ReadyForPickupOrderScreen extends StatelessWidget {
  static const String routeName = '/readyForPickupOrder';
  const ReadyForPickupOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Ready For Delivery/Pickup"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.045,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return PickupOrderCard(
              orderId: "8428489",
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
