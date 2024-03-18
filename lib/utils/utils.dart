import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
import 'package:tb_patner/res/constants/app_images.dart';
import 'package:tb_patner/res/constants/app_text.dart';
import 'package:tb_patner/res/comman/my_text.dart';
import 'package:tb_patner/utils/enum.dart';

import '../data/models/order.dart';
import '../data/models/products.dart';
import '../res/constants/appList.dart';

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

  // Function to remove the splash effect when we click
  static ThemeData noSplashEffect(BuildContext context) {
    return Theme.of(context).copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  // Function taking category enum and returing it as a String
  static String getCategoryStringNew(ProductCategories category) {
    List<String> categories = [
      'Cannabis',
      'Vegitable and Fruits',
      'Personal Care',
      'Home Care',
      'Drinks',
    ];
    return categories[category.index];
  }

  // Function taking paymentMode enum and returing it as a String
  static String getPaymentModeString(PaymentMode mode) {
    List<String> modes = [
      'Cash On Delivery',
      'VIA Credit Card',
      'VIA Debit Card',
      'Stripe',
    ];
    return modes[mode.index];
  }

  // Fuction take orderStatus enum and return  string
  static String getOrderStatusString(OrderStatus status) {
    List<String> orderStaus = [
      "Received",
      "Accepted",
      "Processing",
      "Ready For Pickup",
      "Out For Delivery",
      "Delivered",
      "Cancelled",
    ];
    return orderStaus[status.index];
  }

  // Function generating 100 products
  static List<Product> generateDummyProducts() {
    List<Product> products = [];
    Random random = Random();

    // Function to generate a random product name based on category
    String generateProductName(ProductCategories category, Random random) {
      List<String> words = AppList.categoryWords[category]!;
      String prefix = words[random.nextInt(words.length)];
      String suffix = 'Product';
      return '$prefix $suffix';
    }

    for (int i = 0; i < 100; i++) {
      ProductCategories category = ProductCategories
          .values[random.nextInt(ProductCategories.values.length)];
      String productName = generateProductName(category, random);
      products.add(
        Product(
          id: 'P${i + 1}',
          name: productName,
          price: double.parse((random.nextDouble() * 100).toStringAsFixed(2)),
          description: 'Description of Product ${i + 1}',
          category: category,
          availableQuantity: random.nextInt(100),
          productVisibility: random.nextBool(),
          thumbnailImg: AppImages.organicCBDFlower,
          imgs: [AppImages.organicCBDFlower, AppImages.bong],
        ),
      );
    }

    return products;
  }

  // Fucntion generate 100 dummy orders
  static List<Orders> generateDummyOrders(List<Product> dummyProducts) {
    List<Orders> orders = [];
    Random random = Random();

    for (int i = 0; i < 100; i++) {
      List<Product> orderProducts = [];
      // Randomly choose between 1 to 5 products for each order
      int numberOfProducts = random.nextInt(5) + 1;
      for (int j = 0; j < numberOfProducts; j++) {
        Product product = dummyProducts[random.nextInt(dummyProducts.length)];
        orderProducts.add(product);
      }

      double subTotal =
          orderProducts.map((product) => product.price).reduce((a, b) => a + b);
      // Assuming 10% tax
      double tax = subTotal * 0.1;
      // Assuming fixed delivery charges
      double deliveryCharges = 5.0;
      // Random discount between 0 to 20%
      double discount = random.nextDouble() * 20;
      double total = subTotal + tax + deliveryCharges - discount;
      // Random time
      String time =
          '${random.nextInt(24).toString().padLeft(2, '0')}:${random.nextInt(60).toString().padLeft(2, '0')}';

      // Random Payment mode
      final paymentMode =
          PaymentMode.values[random.nextInt(PaymentMode.values.length)];
      orders.add(
        Orders(
          id: 'O${i + 1}',
          date: '2024-03-${random.nextInt(30) + 1}',
          time: time,
          paymentMode: paymentMode,
          products: orderProducts,
          status: OrderStatus.values[random.nextInt(OrderStatus.values.length)],
          subTotal: double.parse(subTotal.toStringAsFixed(2)),
          tax: double.parse(tax.toStringAsFixed(2)),
          deliveryCharges: double.parse(deliveryCharges.toStringAsFixed(2)),
          discount: double.parse(discount.toStringAsFixed(2)),
          total: double.parse(total.toStringAsFixed(2)),
          deliveryAddress: 'Address of Order ${i + 1}',
        ),
      );
    }

    return orders;
  }

  // Checking the order status and on based of it its returing row
  static Row checkOrderStatus(OrderStatus status, double width) {
    Color statusColor = AppColor.statusColors[status] ?? Colors.grey;
    String statusText = AppText.statusTexts[status] ?? "Order Pending";

    return Row(
      children: [
        CircleAvatar(
          radius: width * 0.008,
          backgroundColor: statusColor,
        ),
        SizedBox(width: width * 0.01),
        MyTextPoppines(
          text: statusText,
          fontSize: width * 0.028,
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
