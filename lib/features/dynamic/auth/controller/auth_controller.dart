import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tb_patner/res/comman/app_snack_bar.dart';
import 'package:tb_patner/res/comman/app_toast_bar.dart';
import 'package:tb_patner/utils/extensions/extensions.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  /// Controllers
  // signin controllers
  TextEditingController siginEmailController = TextEditingController();
  TextEditingController siginPasswordController = TextEditingController();

  // signup controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  TextEditingController storeAddressController = TextEditingController();

  /// Dispose
  @override
  void dispose() {
    siginEmailController.dispose();
    siginPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confrimPasswordController.dispose();
    storeAddressController.dispose();
    super.dispose();
  }

  /// Keys
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  /// Nodes
  FocusNode nameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode storeNode = FocusNode();

  /// Variables
  final Rx<bool> _isTNCAccepted = false.obs;

  /// Getters
  bool get isTNCAccepted => _isTNCAccepted.value;

  /// Methods

  // on Terms and Conditions Clicked
  void onTNCTapped() => _isTNCAccepted.value = !_isTNCAccepted.value;

  // signin
  void onSignIn(BuildContext context) {
    if (signInFormKey.currentState!.validate()) {
      Get.delete<AuthController>();
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/bottomBar',
        (route) => false,
      );
    }
  }

  // signup
  void onSignUp(BuildContext context) {
    //   if (signUpFormKey.currentState!.validate()) {
    if (_isTNCAccepted.value) {
      Get.delete<AuthController>();
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/bottomBar',
        (route) => false,
      );
    } else {
      MySnackBar.show(context, "Please accept terms and conditions to proceed");
    }
  }
  //}
}
