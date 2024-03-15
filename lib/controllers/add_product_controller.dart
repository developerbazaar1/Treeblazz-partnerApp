import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  static AddProductController get instance => Get.find();

  // controllers

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  //var
  final Rx<int> _addProductQuantity = 0.obs;
  Rx<int> get addProductQuantity => _addProductQuantity;

  void incrementProductQuantity() {
    int currentQuantity = int.tryParse(quantityController.text) ?? 0;
    _addProductQuantity.value = currentQuantity + 1;
    quantityController.text = _addProductQuantity.value.toString();
  }

  void decrementProductQuantity() {
    int currentQuantity = int.tryParse(quantityController.text) ?? 0;
    if (currentQuantity > 0) {
      _addProductQuantity.value = currentQuantity - 1;
      quantityController.text = _addProductQuantity.value.toString();
    }
  }
}
