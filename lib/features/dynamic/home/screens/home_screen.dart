import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/home/widgets/home_appbar.dart';
import 'package:tb_patner/features/dynamic/home/widgets/home_dashboard_container_dart';
import 'package:tb_patner/features/dynamic/order/controller/order_controller.dart';
import 'package:tb_patner/res/constants/appList.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final orderController = OrderController.instance;

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: const HomeAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.045,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            MyTextSansPro(
              text: "Dashborad",
              fontSize: width * 0.06,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: AppList.dashboardOrder.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: width * 0.04,
                  mainAxisSpacing: height * 0.015,
                  childAspectRatio: height * 0.0016,
                ),
                itemBuilder: (context, index) {
                  final order = AppList.dashboardOrder[index];
                  return HomeDashboardContainers(
                    quantity: orderController
                        .getOrderLengthByStatus(order.orderStatus),
                    title: order.title,
                    boxColor: order.boxColor,
                    isNewOrder: index == 0 ? true : false,
                    onTap: () => context.pushNamedRoute(order.route),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
