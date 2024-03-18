import 'package:flutter/material.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
import 'my_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onBack;
  final bool? isBackIcon;
  const MyAppBar({
    super.key,
    required this.text,
    this.textColor,
    this.onBack,
    this.isBackIcon,
  }) : preferredSize = const Size.fromHeight(70);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        children: [
          AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leadingWidth: width / 6.5,
            leading: isBackIcon ?? true
                ? Padding(
                    padding:
                        EdgeInsets.only(left: width / 18, top: height / 45),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: width * 0.09,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.01),
                          color: AppColor.lightBlue,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.darkBlue,
                          size: width / 22,
                        ),
                      ),
                    ),
                  )
                : null,
            title: Padding(
              padding: EdgeInsets.only(top: height / 40),
              child: MyTextPoppines(
                text: text,
                fontSize: width * 0.048,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          SizedBox(height: height / 90),
        ],
      ),
    );
  }
}

class MyAppBarWithoutButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  final Color? textColor;
  const MyAppBarWithoutButton({
    super.key,
    required this.text,
    this.textColor,
  }) : preferredSize = const Size.fromHeight(70);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        children: [
          AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: const SizedBox(),
            title: Padding(
              padding: EdgeInsets.only(top: height / 40),
              child: MyTextPoppines(
                text: text,
                fontSize: width * 0.048,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          SizedBox(height: height / 90),
        ],
      ),
    );
  }
}
