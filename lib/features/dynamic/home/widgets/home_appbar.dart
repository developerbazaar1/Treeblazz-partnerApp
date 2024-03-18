import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/app_buttomBar.dart';
import 'package:tb_patner/res/constants/app_images.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.04, left: width * 0.03),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushScreen(
                const AppBottomBar(selectedIndex: 4),
              );
            },
            child: CircleAvatar(
              radius: width * 0.065,
              backgroundImage: const AssetImage(
                AppImages.man,
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          MyTextSansPro(
            text: "Lorem Store",
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
            height: 3,
          ),
        ],
      ),
    );
  }
}
