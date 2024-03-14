import 'package:get/get.dart';
import 'package:tb_patner/data/models/order.dart';
import 'package:tb_patner/data/models/products.dart';
import 'package:tb_patner/utils/utils.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  // variables
  List<Product>? _dummyProducts;

  // check if the product are empty only if it generate dummyorder list
  List<Product> get dummyProducts {
    _dummyProducts ??= Utils.generateDummyProducts();
    return _dummyProducts!;
  }
}
