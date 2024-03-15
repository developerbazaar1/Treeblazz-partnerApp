import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/controllers/products_controller.dart';
import 'package:tb_patner/data/models/products.dart';
import 'package:tb_patner/features/products/widgets/add_product_floating_button.dart';
import 'package:tb_patner/features/products/widgets/filter_product_button.dart';
import 'package:tb_patner/features/products/widgets/product_card.dart';
import 'package:tb_patner/features/products/widgets/search_textfeild.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

import '../../../res/comman/app_colors.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/products';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    final productController = ProductController.instance;

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
                const FilterProductButton(),
              ],
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: RefreshIndicator(
                  color: Colors.black,
                  backgroundColor: AppColor.lightPink,
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    productController.refreshProducts();
                  },
                  child: Obx(
                    () => ListView.builder(
                      itemCount: productController.filteredProducts.length,
                      itemBuilder: (context, index) {
                        final List<Product> products =
                            productController.filteredProducts;
                        return ProductCard(product: products[index]);
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: const AddProductFloatingActionButton(),
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
