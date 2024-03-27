import 'package:flutter/material.dart';
import 'package:tb_patner/features/dynamic/auth/controller/auth_controller.dart';
import 'package:tb_patner/features/dynamic/auth/view/widgets/passwordTextFeild.dart';
import 'package:tb_patner/features/dynamic/auth/view/widgets/signup_upload_identity_widget.dart';
import 'package:tb_patner/res/comman/my_text_feild.dart';
import 'package:tb_patner/res/comman/upload_image_container_widget.dart';

import '../../../../../res/comman/my_redbutton.dart';
import '../../../../../res/comman/my_text.dart';
import '../../../../../res/constants/app_colors.dart';
import '../../../../../utils/utils.dart';
import '../../../../../utils/validators/validators.dart';
import '../widgets/custom_checkbox_widget.dart';
import '../widgets/login_with_socail_widget.dart';
import '../widgets/signinup_heading_widget.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final signUpContoller = AuthController.instance;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.045,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              // Signup + Signin Button + Create your free account
              InkWell(
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
              SizedBox(height: height * 0.02),
              const SignInUpHeading(isSignIn: false),
              SizedBox(height: height * 0.03),
              // Textfields
              Form(
                key: signUpContoller.signUpFormKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    MyTextFeild(
                      controller: signUpContoller.nameController,
                      headingText: "Full Name",
                      hintText: "Jhon deo",
                      focusNode: signUpContoller.nameNode,
                      validator: Validator().nullValidator,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            signUpContoller.nameNode,
                            signUpContoller.phoneNode);
                      },
                    ),
                    MyTextFeild(
                      controller: signUpContoller.phoneController,
                      headingText: "Phone Number",
                      hintText: "79493**00",
                      focusNode: signUpContoller.phoneNode,
                      validator: Validator().validateContactNo,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            signUpContoller.phoneNode,
                            signUpContoller.emailNode);
                      },
                    ),
                    MyTextFeild(
                      controller: signUpContoller.emailController,
                      headingText: "Email Address",
                      hintText: "****@gmail.com",
                      focusNode: signUpContoller.emailNode,
                      validator: Validator().validateEmail,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            signUpContoller.emailNode,
                            signUpContoller.passwordNode);
                      },
                    ),
                    PasswordTextFeild(
                      controller: signUpContoller.passwordController,
                      headingText: "Password",
                      hintText: "**********",
                      focusNode: signUpContoller.passwordNode,
                      validator: Validator().validatePassword,
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            signUpContoller.passwordNode,
                            signUpContoller.confirmPasswordNode);
                      },
                    ),
                    PasswordTextFeild(
                      controller: signUpContoller.confrimPasswordController,
                      headingText: "Confrim Password",
                      hintText: "***********",
                      focusNode: signUpContoller.confirmPasswordNode,
                      validator: (value) {
                        return Validator().validateConfirmPassword(
                          value: value,
                          valController:
                              signUpContoller.passwordController.text,
                        );
                      },
                      onSubmit: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            signUpContoller.confirmPasswordNode,
                            signUpContoller.storeNode);
                      },
                    ),
                    MyTextFeild(
                      controller: signUpContoller.storeAddressController,
                      headingText: "Store Address",
                      hintText: "Enter store address",
                      focusNode: signUpContoller.storeNode,
                      validator: Validator().nullValidator,
                    ),
                  ],
                ),
              ),

              // Upload Store Images
              SizedBox(height: height * 0.02),
              MyTextPoppines(
                text: "Store Images",
                fontSize: width * 0.038,
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.025),
              AddImageContainer(
                text: "Upload Store Images",
                note: "Add multiple store images",
                onTap: () {},
              ),
              // Upload identity
              SizedBox(height: height * 0.01),
              const SignupUploadIdentity(),
              // Check box + Text
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCheckbox(),
                  SizedBox(
                    width: width * 0.8,
                    child: MyTextPoppines(
                      text:
                          "By doing signup you agree with all Terms and Conditions",
                      fontSize: width * 0.032,
                      height: 1.5,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              CustomButton(
                text: "Sign Up",
                onTap: () => signUpContoller.onSignUp(context),
              ),
              SizedBox(height: height * 0.01),
              const LoginWithSocialWidget()
            ],
          ),
        ),
      ),
    );
  }
}
