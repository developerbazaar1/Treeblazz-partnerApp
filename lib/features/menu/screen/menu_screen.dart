import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/appList.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';

import '../widgets/menu_categories_contianer.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const MyAppBar(text: "Menu"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: AppList.menuCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: width * 0.04,
            mainAxisSpacing: height * 0.015,
            childAspectRatio: height * 0.001,
          ),
          itemBuilder: (context, index) {
            final menu = AppList.menuCategories[index];
            return MenuCategoriesContainer(
              title: menu.title,
              img: menu.img,
              boxColor: menu.color,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
