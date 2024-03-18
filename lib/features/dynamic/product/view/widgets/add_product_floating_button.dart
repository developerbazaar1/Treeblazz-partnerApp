import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../../../res/constants/app_colors.dart';
import '../../../../../res/comman/my_text.dart';

class AddProductFloatingActionButton extends StatefulWidget {
  const AddProductFloatingActionButton({super.key});

  @override
  State<AddProductFloatingActionButton> createState() =>
      _AddProductFloatingActionButtonState();
}

class _AddProductFloatingActionButtonState
    extends State<AddProductFloatingActionButton> {
  bool isExpanded = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isExpanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      //
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: isExpanded ? width * 0.4 : width * 0.1,
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        decoration: BoxDecoration(
          color: AppColor.redColor,
          borderRadius: BorderRadius.circular(isExpanded ? width * 0.03 : 100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isExpanded)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.01,
                    left: width * 0.035,
                  ),
                  child: InkWell(
                    onTap: () => context.pushNamedRoute('/addProduct'),
                    child: MyTextSansPro(
                      text: "Add Product",
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            Icon(
              Iconsax.box_add_copy,
              color: AppColor.white,
              size: width * 0.05,
            ),
            if (isExpanded) SizedBox(width: width * 0.04),
          ],
        ),
      ),
    );
  }
}
