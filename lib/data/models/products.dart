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
