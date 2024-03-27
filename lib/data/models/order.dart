import 'package:tb_patner/utils/enum.dart';

import 'products.dart';

// class Order {
//   final String id;
//   final String price;
//   final String date;
//   final String time;
//   final String img;

//   Order({
//     required this.id,
//     required this.price,
//     required this.date,
//     required this.time,
//     required this.img,
//   });
// }

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
