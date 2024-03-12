import 'package:flutter/material.dart' show Color;

class DashboardOrder {
  final int quantity;
  final String title;
  final Color boxColor;

  DashboardOrder({
    required this.quantity,
    required this.title,
    required this.boxColor,
  });
}
