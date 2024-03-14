import 'package:get/get.dart';
import 'package:tb_patner/controllers/products_controller.dart';
import 'package:tb_patner/utils/utils.dart';

import '../data/models/order.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  final controller = ProductController.instance;
  // variables
  List<Orders>? _dummyOrders;

  // check if the order are empty only if it generate dummyorder list
  List<Orders> get dummyOrders {
    _dummyOrders ??= Utils.generateDummyOrders(controller.dummyProducts);
    return _dummyOrders!;
  }
}
