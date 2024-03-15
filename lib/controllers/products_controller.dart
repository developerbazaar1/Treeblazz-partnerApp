import 'package:get/get.dart';
import 'package:tb_patner/data/models/products.dart';
import 'package:tb_patner/utils/enum.dart';
import 'package:tb_patner/utils/utils.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  @override
  void onInit() {
    _dummyProducts.addAll(Utils.generateDummyProducts());
    _filteredProducts.assignAll(_dummyProducts);
    super.onInit();
  }

  // variables
  final RxList<Product> _dummyProducts = <Product>[].obs;
  final RxList<Product> _filteredProducts = <Product>[].obs;

  // check if the product are empty only if it generate dummyorder list
  List<Product> get dummyProducts {
    if (_dummyProducts.isEmpty) {
      _dummyProducts.addAll(Utils.generateDummyProducts());
    }
    return _dummyProducts;
  }

  List<Product> get filteredProducts => _filteredProducts;

  // filtering the order based on their status
  void filterProducts(ProductCategories categories) {
    _filteredProducts.assignAll(_dummyProducts.where((product) {
      return product.category == categories;
    }));
  }

  void clearFilter() {
    _filteredProducts.assignAll(_dummyProducts);
  }

  // Update the list when the page is refreshed
  List<Product> refreshProducts() {
    _dummyProducts.clear();
    _dummyProducts.value = Utils.generateDummyProducts();
    clearFilter();
    return _dummyProducts;
  }
}
