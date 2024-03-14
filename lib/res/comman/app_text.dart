import 'package:tb_patner/utils/enum.dart';

class AppText {
  static const String productDesc =
      "Introducing GreenGrove Herbal Bliss, the premium choice for your cannabis experience.";

  static Map<OrderStatus, String> statusTexts = {
    OrderStatus.received: "Order Received",
    OrderStatus.accepted: "Order Accepted",
    OrderStatus.delivered: "Order Delivered",
    OrderStatus.cancelled: "Order Cancelled",
    OrderStatus.processing: "Order Processing",
    OrderStatus.readyForPickup: "Ready for Pickup",
    OrderStatus.outForDelivery: "Out for Delivery",
  };
}
