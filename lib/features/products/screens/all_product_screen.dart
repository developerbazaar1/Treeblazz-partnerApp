import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/orders%20detailes/screen/order_detaile_screen.dart';
import 'package:tb_patner/features/products/widgets/search_textfeild.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_redbutton.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/products';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Products"),
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
                    return ProductCard(
                      orderId: order.id,
                      price: order.price,
                      date: order.date,
                      time: order.time,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String time;
  final String price;
  final VoidCallback? onTap;
  const ProductCard({
    super.key,
    required this.price,
    required this.orderId,
    required this.date,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).pushScreen(
              const OrderDetaileScreen(isNewOrder: true),
            );
          },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.01),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.02),
          color: AppColor.containerGreyBg,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.3,
              height: height * 0.1,
              child: Image.asset(
                AppImages.organicCBDFlower,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextSansPro(
                  text: "Flower",
                  fontSize: width * 0.035,
                  color: AppColor.redColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.002),
                MyTextSansPro(
                  text: "Organic CBD Flower ",
                  fontSize: width * 0.042,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: height * 0.005),
                MyTextSansPro(
                  text: "Available Quantity : 20",
                  fontSize: width * 0.035,
                  color: AppColor.greyColor,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: height * 0.005),
                MyTextPoppines(
                  text: price,
                  fontSize: width * 0.045,
                  color: AppColor.redColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Icon(
              Iconsax.edit_copy,
              color: AppColor.black,
              size: width * 0.036,
            ),
          ],
        ),
      ),
    );
  }
}



// class ProductScreen extends StatelessWidget {
//   static const String routeName = '/menu';
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height;
//     final width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: const MyAppBar(text: "Menu"),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: height * 0.01,
//           horizontal: width * 0.045,
//         ),
//         child: GridView.builder(
//           padding: EdgeInsets.zero,
//           physics: const BouncingScrollPhysics(),
//           itemCount: AppList.menuCategories.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: width * 0.04,
//             mainAxisSpacing: height * 0.015,
//             childAspectRatio: height * 0.001,
//           ),
//           itemBuilder: (context, index) {
//             final menu = AppList.menuCategories[index];
//             return MenuCategoriesContainer(
//               title: menu.title,
//               img: menu.img,
//               boxColor: menu.color,
//               onTap: () {
//                 Navigator.of(context).pushScreen(
//                   MenuCategoriesProductsScreen(
//                     prodcutName: menu.title,
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
