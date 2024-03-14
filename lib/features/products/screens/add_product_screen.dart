import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/products/widgets/custom_dropdown_button.dart';
import 'package:tb_patner/features/products/widgets/product_quantity_dropdown.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/app_toast_bar.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';

import '../../../res/comman/my_redbutton.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = '/addProduct';
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(text: "Add Product"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.045,
          ),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: nameController,
                      headingText: "Product Name",
                      hintText: "Enter product name",
                    ),
                    MyTextFeild(
                      controller: descriptionController,
                      headingText: "Product Description",
                      hintText: "Enter product description",
                    ),
                    MyTextFeild(
                      controller: priceController,
                      headingText: "Product Price",
                      hintText: "Enter product price",
                    ),
                    CustomDropdownButton(
                      heading: "Quantity",
                      itemList: AppList.quantity,
                    ),
                    CustomDropdownButton(
                      heading: "Categories",
                      itemList: AppList.categories,
                    ),
                    SizedBox(height: height * 0.03),
                    ProductAddImgDottedContainer(
                      text: "Add Product Images",
                      onTap: () {},
                    ),
                    SizedBox(height: height * 0.03),
                    ProductAddImgDottedContainer(
                      text: "Add Product Thumbnail",
                      onTap: () {},
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              )
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
          child: CustomButton(
            text: "Add Product",
            onTap: () {
              ToastBar.show(context, "Product Added succesfully!");
              Navigator.of(context).pop();
            },
            vspacing: height * 0.02,
            fontSize: width * 0.048,
          ),
        ),
      ),
    );
  }
}

class ProductAddImgDottedContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ProductAddImgDottedContainer(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(width * 0.04),
      color: AppColor.greyColor,
      dashPattern: const [8, 4],
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.06),
        decoration: BoxDecoration(
          color: AppColor.containerGreyBg,
          borderRadius: BorderRadius.circular(width * 0.04),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextPoppines(
              text: text,
              fontSize: width * 0.038,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
            SizedBox(width: width * 0.034),
            InkWell(
              onTap: onTap,
              child: Icon(
                Iconsax.gallery_add_copy,
                size: width * 0.06,
                color: AppColor.redColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
