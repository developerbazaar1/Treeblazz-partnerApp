import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

import '../../../res/comman/my_text.dart';
import '../widgets/profile_card_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    List<String> profileOptions = [
      "Order History",
      "My Finance",
      "Change Password",
      "Notification Sound",
      "Terms and Conditions",
      // "Privacy Polices",
      "Help",
      "FAQ",
      "Sign Out"
    ];
    List onTapOnList = [
      () {},
      () => context.pushNamedRoute("/myFinance"),
      () => context.pushNamedRoute("/changePassword"),
      () => context.pushNamedRoute("/notification"),
      () => context.pushNamedRoute("/tandc"),
      //() => context.pushNamedRoute("/privacy"),
      () => context.pushNamedRoute("/support"),
      () => context.pushNamedRoute("/faq"),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/signin',
            (route) => false,
          ),
    ];
    return Scaffold(
      appBar: const MyAppBarWithoutButton(text: "Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.045,
        ),
        child: Column(
          children: [
            // Profile details
            Container(
              width: width,
              height: height * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFEFEFEF),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: CircleAvatar(
                          radius: width * 0.08,
                          backgroundImage: const AssetImage(AppImages.man),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: height * 0.035),
                          MyTextSansPro(
                            text: "Jhon Doe",
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: height * 0.004),
                          MyTextSansPro(
                            text: "+1252051511",
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 134, 133, 133),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.03),
                    child: InkWell(
                      onTap: () => context.pushNamedRoute('/editProfile'),
                      child: CircleAvatar(
                        radius: width * 0.055,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: profileOptions.length,
                itemBuilder: (context, index) {
                  return BuildProfileCard(
                    heading: profileOptions[index],
                    onTap: onTapOnList[index],
                    headingColor: index == 7 ? AppColor.redColor : Colors.black,
                    isArrow: index == 7 ? false : true,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
