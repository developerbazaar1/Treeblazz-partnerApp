import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/app_images.dart';
import 'package:tb_patner/res/comman/my_appbar.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';

import '../../../res/comman/my_redbutton.dart';

class SupportScreen extends StatelessWidget {
  static const String routeName = '/support';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: MyAppBar(text: "Help & Support"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.045,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.support,
                  width: width * 0.7,
                  height: height * 0.32,
                  fit: BoxFit.cover,
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: MyTextPoppines(
              //     text: "Get the Assistance You Need",
              //     fontSize: width * 0.038,
              //     fontWeight: FontWeight.w600,
              //     color: AppColor.black,
              //   ),
              // ),

              SizedBox(height: height * 0.03),
              MyTextFeild(
                controller: nameController,
                headingText: "Name",
                hintText: "Enter your name",
              ),
              MyTextFeild(
                controller: emailController,
                headingText: "Email",
                hintText: "Enter your email",
              ),
              MyTextFeild(
                controller: messageController,
                headingText: "Query",
                hintText: "Enter your query here",
                maxLines: 4,
              ),
              SizedBox(height: height * 0.03),
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
            text: "Send",
            onTap: () => Navigator.of(context).pop(),
            vspacing: height * 0.02,
            fontSize: width * 0.05,
          ),
        ),
      ),
    );
  }
}
