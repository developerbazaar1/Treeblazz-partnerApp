import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/data/models/products.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';
import 'package:tb_patner/utils/utils.dart';

import '../../../res/comman/app_colors.dart';
import '../../../res/comman/my_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
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
                text: Utils.getCategoryStringNew(product.category),
                fontSize: width * 0.035,
                color: AppColor.redColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.002),
              MyTextSansPro(
                text: product.name,
                fontSize: width * 0.042,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.005),
              MyTextSansPro(
                text: "Available Quantity : ${product.availableQuantity}",
                fontSize: width * 0.035,
                color: AppColor.greyColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: height * 0.005),
              MyTextPoppines(
                text: "\$${product.price}",
                fontSize: width * 0.045,
                color: AppColor.redColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          InkWell(
            onTap: () => context.pushNamedRoute('/editProductPriceQuantity'),
            child: Icon(
              Iconsax.edit_copy,
              color: AppColor.black,
              size: width * 0.038,
            ),
          ),
        ],
      ),
    );
  }
}
