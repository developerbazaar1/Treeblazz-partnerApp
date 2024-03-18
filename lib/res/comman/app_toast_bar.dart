import 'package:flutter/material.dart';
import 'package:tb_patner/res/constants/app_colors.dart';
import 'package:tb_patner/res/comman/my_text.dart';

class ToastBar {
  static void show(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: 0.0,
        right: 0.0,
        child: ToastWidget(message: message),
      ),
    );

    overlay.insert(overlayEntry);

    // After 2 seconds, remove the toast
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: MyTextPoppines(
          text: message,
          color: AppColor.white,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
