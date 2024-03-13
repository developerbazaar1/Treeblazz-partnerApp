class Order {
  final String id;
  final String price;
  final String date;
  final String time;
  final String img;

  Order(
      {required this.id,
      required this.price,
      required this.date,
      required this.time,
      required this.img});
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

class Orders {
  final String id;
  final String date;
  final String time;
  final PaymentMode paymentMode;
  final List<Product> products;
  final OrderStatus status;
  final double subTotal;
  final double tax;
  final double deliveryCharges;
  final double discount;
  final double total;
  final String deliveryAddress;

  Orders({
    required this.id,
    required this.date,
    required this.time,
    required this.paymentMode,
    required this.products,
    required this.status,
    required this.subTotal,
    required this.tax,
    required this.deliveryCharges,
    required this.discount,
    required this.total,
    required this.deliveryAddress,
  });
}

enum ProductCategories { cannabis, homeCare, drinks, vegitable }

enum PaymentMode { cod, online }

enum OrderStatus {
  received,
  accepted,
  processing,
  packed,
  readyForPickup,
  pickedUpByDriver,
  outForDelivery,
  delivered,
  canceled,
}
