import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/data/models/dashboard_order.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/app_buttomBar.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    List onTapContainer = [
      '/readyForPickupOrder',
      '/deliveredOrders',
      '/deliveredOrders',
      '/readyForPickupOrder',
      '/deliveredOrders',
      '/deliveredOrders',
      '/cancelledOrder',
    ];
    final spacing = SizedBox(height: height * 0.035);
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
                    quantity: order.quantity,
                    title: order.title,
                    boxColor: order.boxColor,
                    isNewOrder: index == 0 ? true : false,
                    onTap: () {
                      index == 0
                          ? Navigator.of(context).pushScreen(
                              const AppBottomBar(selectedIndex: 2),
                            )
                          : context.pushNamedRoute(
                              onTapContainer[index],
                            );
                    },
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

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.04, left: width * 0.03),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).pushScreen(
              //   const AppBottomBar(selectedIndex: 4),
              // );
            },
            child: CircleAvatar(
              radius: width * 0.065,
              backgroundImage: const AssetImage(
                AppImages.man,
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          MyTextSansPro(
            text: "Lorem Store",
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
            height: 3,
          ),
        ],
      ),
    );
  }
}

class HomeDashboardContainers extends StatelessWidget {
  final int quantity;
  final String title;
  final Color boxColor;
  final VoidCallback onTap;
  final bool? isNewOrder;
  const HomeDashboardContainers({
    super.key,
    required this.quantity,
    required this.title,
    required this.boxColor,
    required this.onTap,
    this.isNewOrder,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.03),
          color: boxColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextPoppines(
              text: quantity.toString(),
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: isNewOrder ?? false ? AppColor.redColor : AppColor.black,
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.3,
              child: MyTextPoppines(
                text: title,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.hd_greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
