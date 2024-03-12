import 'package:flutter/material.dart';
import 'package:tb_patner/utils/enum.dart';

class Utils {
  // Private constructor
  Utils._();

  // Function to change the focus from the current textfield to another with keyboard
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String getCategoryString(ProductCategory category) {
    switch (category) {
      case ProductCategory.flower:
        return "Flowers";
      case ProductCategory.preroll:
        return "Preroll";
      case ProductCategory.bong:
        return "Bong";
      case ProductCategory.pipe:
        return "Pipe";
      case ProductCategory.vap:
        return "Vaporizer";
      case ProductCategory.grinders:
        return "Grinder";
      case ProductCategory.cartridges:
        return "Cartridges";
      case ProductCategory.edibles:
        return "Edibles";
      case ProductCategory.smoking:
        return "Smoking Accessories";
      default:
        return "Unknown";
    }
  }
}
