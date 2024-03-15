import 'package:flutter/material.dart' show Color;
import 'package:tb_patner/utils/enum.dart';

class DashboardOrder {
  final String title;
  final Color boxColor;
  final OrderStatus orderStatus;
  final String route;

  DashboardOrder(
      {required this.title,
      required this.boxColor,
      required this.orderStatus,
      required this.route});
}
