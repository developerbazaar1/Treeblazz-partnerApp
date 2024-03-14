import 'package:tb_patner/data/models/order.dart';

import '../../utils/enum.dart';

class Products {
  final ProductCategory category;
  final String name;
  final int price;
  final String description;
  final double rating;
  final List images;

  Products(
    this.name,
    this.price,
    this.description,
    this.rating,
    this.images,
    this.category,
  );
}

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final ProductCategories category;
  final int availableQuantity;
  final bool productVisibility;
  final String thumbnailImg;
  final List imgs;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.availableQuantity,
    required this.productVisibility,
    required this.thumbnailImg,
    required this.imgs,
  });
}
