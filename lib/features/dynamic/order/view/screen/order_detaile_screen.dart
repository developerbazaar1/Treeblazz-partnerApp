import 'package:flutter/material.dart';
import 'package:tb_patner/data/models/order.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/order_status_screen.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/order_billing_card_widget.dart';
import 'package:tb_patner/features/dynamic/order/view/widget/order_detail_card_widget.dart';
import 'package:tb_patner/features/dynamic/product/view/widgets/product_card.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_redbutton.dart';
import 'package:tb_patner/utils/enum.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';
import 'package:tb_patner/utils/utils.dart';

import '../../../../../res/constants/app_colors.dart';
import '../../../../../res/comman/app_toast_bar.dart';
import '../../../../../res/comman/my_text.dart';

class OrderDetaileScreen extends StatelessWidget {
  final Orders? order;
  static const String routeName = '/orderDetaile';
  const OrderDetaileScreen({
    super.key,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final productLength = order!.products.length;
    final productHeight = height * (productLength > 1 ? 0.26 : 0.18);

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
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextSansPro(
                    text: "Order Status",
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                  Utils.checkOrderStatus(order!.status, width),
                ],
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: productHeight,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: order!.products.length,
                  itemBuilder: (context, index) {
                    final product = order!.products[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              MyTextSansPro(
                text: "Order Details",
                fontSize: width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.02),
              OrderDetailsCard(order: order!),
              SizedBox(height: height * 0.02),
              OrderBillingCard(order: order!),
              SizedBox(height: height * 0.02),
              CustomButton(
                text: "Track Order",
                fontSize: width * 0.048,
                hspacing: width * 0.13,
                vspacing: height * 0.016,
                onTap: () {
                  Navigator.of(context).pushScreen(
                    OrderStatusScreen(
                      orderStatus: order!.status,
                    ),
                  );
                },
              ),
              Visibility(
                visible: order!.status != OrderStatus.received,
                child: SizedBox(height: height * 0.02),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: order!.status != OrderStatus.received
          ? null
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: height * 0.070,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Cancel",
                        fontSize: width * 0.048,
                        hspacing: width * 0.13,
                        buttonColor: AppColor.black,
                        onTap: () {
                          ToastBar.show(
                            context,
                            "Order Cancelled Successfully",
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Expanded(
                      child: CustomButton(
                        text: "Confrim",
                        fontSize: width * 0.048,
                        hspacing: width * 0.13,
                        onTap: () {
                          ToastBar.show(
                            context,
                            "Order Confrimed Successfully",
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
