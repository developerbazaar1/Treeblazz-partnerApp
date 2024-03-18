import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/dynamic/product/controller/add_product_controller.dart';
import 'package:tb_patner/features/dynamic/notification/screen/notification_screen.dart';
import 'package:tb_patner/features/dynamic/product/view/widgets/custom_dropdown_button.dart';
import 'package:tb_patner/res/comman/app_toast_bar.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';
import 'package:tb_patner/res/comman/upload_image_container_widget.dart';
import 'package:tb_patner/res/constants/appList.dart';
import 'package:tb_patner/res/constants/app_colors.dart';

import '../../../../../res/comman/my_redbutton.dart';

class AddProductScreen extends StatelessWidget {
  static const String routeName = '/addProduct';
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final addProductController = AddProductController.instance;

    return Scaffold(
      appBar: const MyAppBar(text: "Add Product"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: addProductController.nameController,
                      headingText: "Product Name",
                      hintText: "Enter product name",
                    ),
                    MyTextFeild(
                      controller: addProductController.descriptionController,
                      headingText: "Product Description",
                      hintText: "Enter product description",
                      maxLines: 5,
                    ),
                    MyTextFeild(
                      controller: addProductController.priceController,
                      headingText: "Product Price",
                      hintText: "\$ 0.00",
                      isNumberTypeField: true,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextFeild(
                            controller: addProductController.quantityController,
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
                              onTap: () => addProductController
                                  .incrementProductQuantity(),
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
                              onTap: () => addProductController
                                  .decrementProductQuantity(),
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
                  ],
                ),
              ),
              CustomDropdownButton(
                heading: "Categories",
                itemList: AppList.categories,
              ),
              SizedBox(height: height * 0.03),
              // Upload Thumbnail Image
              AddImageContainer(
                text: "Uploade Thumbnail Images",
                note: "Add a single product thumbnail",
                onTap: () {},
              ),

              SizedBox(height: height * 0.03),
              // Upload Product Images
              AddImageContainer(
                text: "Uploade Product Images",
                note: "Add multiple product images",
                onTap: () {},
              ),

              SizedBox(height: height * 0.04),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextSansPro(
                    text: "Avialable for sale",
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                  const SwtichButton(),
                ],
              ),
              MyTextSansPro(
                text: "Your product will be avialable for sale in your store",
                fontSize: width * 0.032,
                fontWeight: FontWeight.w500,
                color: AppColor.greyColor,
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
