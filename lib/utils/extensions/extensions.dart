import 'dart:developer' as dev show log;
import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/my_text.dart';

extension NavigationExtensions on BuildContext {
  void pushNamedRoute(String routeName) {
    Navigator.pushNamed(this, routeName);
  }
}

// This extension show all the logs on console
// Use it like this -> response.log();
extension Log on Object {
  void log([String tag = 'Log']) => dev.log(toString(), name: tag);
}

extension NavigationExtension on NavigatorState {
  Future pushScreen(Widget screen) async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );
  }
}

extension PriceExtension on String {
  Row priceRow(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextPoppines(
          text: "\$",
          fontSize: size / 2,
          fontWeight: FontWeight.w600,
        ),
        MyTextPoppines(
          text: this,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
        MyTextPoppines(
          text: ".00",
          fontSize: size / 2,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
