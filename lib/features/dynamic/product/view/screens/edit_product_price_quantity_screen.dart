import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/data/models/products.dart';
import 'package:tb_patner/features/dynamic/product/controller/products_controller.dart';
import 'package:tb_patner/res/comman/app_toast_bar.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_redbutton.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';

import '../../../../../res/comman/my_text.dart';
import '../../../../../res/constants/app_colors.dart';
import '../../../../../res/constants/app_images.dart';
import '../../../notification/screen/notification_screen.dart';

class EditProductPriceQuantityScreen extends StatelessWidget {
  static const String routeName = '/editProductPriceQuantity';
  final Product product;
  const EditProductPriceQuantityScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final productController = ProductController.instance;

    TextEditingController nameController =
        TextEditingController(text: product.name);
    TextEditingController priceController =
        TextEditingController(text: product.price.toString());

    return Scaffold(
      appBar: const MyAppBar(text: "Edit Price & Quantity"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.045),
          child: Column(
            children: [
              SizedBox(
                width: width * 0.9,
                height: height * 0.28,
                child: Image.asset(
                  AppImages.organicCBDFlower,
                  fit: BoxFit.cover,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: nameController,
                      headingText: "Product name",
                      hintText: "Organic CBD Flower",
                      hintTextColor: AppColor.black,
                    ),
                    MyTextFeild(
                      controller: priceController,
                      headingText: "Price",
                      hintText: "\$50",
                      hintTextColor: AppColor.black,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyTextFeild(
                      controller: productController.quantityController,
                      headingText: "Quantity",
                      hintText: "0",
                      isNumberTypeField: true,
                    ),
                  ),
                  SizedBox(width: width * 0.04),
                  Column(
                    children: [
                      SizedBox(height: height * 0.055),
                      InkWell(
                        onTap: () =>
                            productController.incrementProductQuantity(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.002,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColor.containerGreyBg,
                          ),
                          child: Icon(
                            Iconsax.arrow_up_1,
                            size: width * 0.045,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      InkWell(
                        onTap: () =>
                            productController.decrementProductQuantity(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.002,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColor.containerGreyBg,
                          ),
                          child: Icon(
                            Iconsax.arrow_down,
                            size: width * 0.045,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextSansPro(
                    text: "Active",
                    fontSize: width * 0.045,
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                  const SwtichButton(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.062,
          vertical: height * 0.02,
        ),
        child: SizedBox(
          height: height * 0.075,
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Update",
                  onTap: () {
                    ToastBar.show(context, "Product Detail has been updated");
                    Navigator.of(context).pop();
                  },
                  vspacing: height * 0.02,
                  fontSize: width * 0.048,
                ),
              ),
              SizedBox(width: width * 0.05),
              Expanded(
                child: CustomButton(
                  text: "Delete",
                  onTap: () {
                    ToastBar.show(context, "Product Detail has been deleted");
                    Navigator.of(context).pop();
                  },
                  buttonColor: AppColor.black,
                  vspacing: height * 0.02,
                  fontSize: width * 0.048,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
