import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tb_patner/features/products/widgets/product_quantity_dropdown.dart';
import 'package:tb_patner/res/comman/app_toast_bar.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_redbutton.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/app_images.dart';
import '../../../res/comman/my_text.dart';
import '../../notification/screen/notification_screen.dart';

class EditProductPriceQuantityScreen extends StatelessWidget {
  static const String routeName = '/editProductPriceQuantity';
  const EditProductPriceQuantityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

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
              const ProductQuantityDropDown(),
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
