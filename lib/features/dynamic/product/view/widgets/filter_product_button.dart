import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/dynamic/product/controller/products_controller.dart';
import 'package:tb_patner/utils/enum.dart';
import 'package:tb_patner/utils/utils.dart';

import '../../../../../res/constants/app_colors.dart';

class FilterProductButton extends StatelessWidget {
  const FilterProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final productController = ProductController.instance;
    return PopupMenuButton(
      icon: CircleAvatar(
        radius: width * 0.06,
        backgroundColor: const Color.fromARGB(255, 244, 245, 247),
        child: const Icon(
          Iconsax.filter,
          color: AppColor.redColor,
        ),
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          for (var category in ProductCategories.values)
            PopupMenuItem(
              value: category,
              child: Text(Utils.getCategoryStringNew(category)),
            ),
          const PopupMenuItem(
            value: 'clear',
            child: Text('Clear Filter'),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 'clear') {
          productController.clearFilter();
        } else {
          productController.filterProducts(value as ProductCategories);
        }
      },
    );
  }
}
