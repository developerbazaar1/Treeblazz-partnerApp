import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    text: "Stock In",
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
          child: CustomButton(
            text: "Update",
            onTap: () {
              ToastBar.show(
                context,
                "Product Detail has been updated succesfully!",
              );
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

class ProductQuantityDropDown extends StatefulWidget {
  const ProductQuantityDropDown({super.key});

  @override
  _ProductQuantityDropDownState createState() =>
      _ProductQuantityDropDownState();
}

class _ProductQuantityDropDownState extends State<ProductQuantityDropDown> {
  String _defaultQuantity = '1 kg'; // Default selected vehicle

  List<String> quantity = [
    '1 kg',
    '2 kg',
    '5 kg',
    '10 kg',
    '15 kg',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: "Quantity",
          fontSize: width * 0.038,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.01),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.0085,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(width * 0.01),
            border: Border.all(
              width: width * 0.002,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _defaultQuantity,
                    icon: const Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColor.black,
                    ),
                    iconSize: width * 0.05,
                    onChanged: (String? newValue) {
                      setState(() {
                        _defaultQuantity = newValue!;
                      });
                    },
                    items: quantity.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyTextPoppines(
                            text: value,
                            fontSize: width * 0.038,
                            color: Colors.black.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
