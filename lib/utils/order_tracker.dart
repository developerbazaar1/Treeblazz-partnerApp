import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/res/comman/my_text.dart';

import 'enum.dart';

class OrderTracker extends StatefulWidget {
  final OrderStatus? status;
  final Color? activeColor;
  final Color? inActiveColor;
  final TextStyle? headingTitleStyle;
  final TextStyle? headingDateTextStyle;
  final TextStyle? subTitleTextStyle;
  final TextStyle? subDateTextStyle;

  const OrderTracker({
    super.key,
    required this.status,
    this.activeColor,
    this.inActiveColor,
    this.headingTitleStyle,
    this.headingDateTextStyle,
    this.subTitleTextStyle,
    this.subDateTextStyle,
  });

  @override
  State<OrderTracker> createState() => _OrderTrackerState();
}

class _OrderTrackerState extends State<OrderTracker>
    with TickerProviderStateMixin {
  // Animation Controllers
  AnimationController? controller;
  AnimationController? controller2;
  AnimationController? controller3;
  AnimationController? controller4;
  AnimationController? controller5;

  ///This is conditional variable.
  bool isFirst = false;
  bool isSecond = false;
  bool isThird = false;
  bool isFourth = false;
  bool isFifth = false;
  bool isCancelled = false;

  @override
  void initState() {
    if (widget.status == OrderStatus.received ||
        widget.status == OrderStatus.cancelled) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
          }
          setState(() {});
        });
    } else if (widget.status == OrderStatus.accepted) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            //   controller2?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
            isSecond = true;
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            controller3?.stop();
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });
    } else if (widget.status == OrderStatus.processing) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            controller2?.stop();
            controller3?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize third controller
      controller3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller3?.value != null && controller3!.value > 0.99) {
            controller3?.stop();
            controller4?.stop();
            isThird = true;
            controller4?.forward(from: 0.0);
          }
          setState(() {});
        });
    } else if (widget.status == OrderStatus.readyForPickup) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            //  controller2?.stop();
            //    controller3?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            //   controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize third controller
      ///initialize third controller
      controller3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller3?.value != null && controller3!.value > 0.99) {
            controller3?.stop();
            //   controller4?.stop();
            isThird = true;
            controller4?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize forth controller
      controller4 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller4?.value != null && controller4!.value > 0.99) {
            controller4?.stop();
            //  controller5?.stop();
            isFourth = true;
            controller5?.forward(from: 0.0);
          }
          setState(() {});
        });
    } else if (widget.status == OrderStatus.outForDelivery ||
        widget.status == OrderStatus.delivered) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            //  controller2?.stop();
            //    controller3?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            //   controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize third controller
      ///initialize third controller
      controller3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller3?.value != null && controller3!.value > 0.99) {
            controller3?.stop();
            //   controller4?.stop();
            isThird = true;
            controller4?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize forth controller
      controller4 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller4?.value != null && controller4!.value > 0.99) {
            controller4?.stop();
            //  controller5?.stop();
            isFourth = true;
            controller5?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize fifth controller
      controller5 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller5?.value != null && controller5!.value > 0.99) {
            controller5?.stop();
            //  controller5?.stop();
            isFifth = true;
          }
          setState(() {});
        });
    }

    controller?.repeat(reverse: false);
    controller2?.repeat(reverse: false);
    controller3?.repeat(reverse: false);
    controller4?.repeat(reverse: false);
    controller5?.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
    controller5?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Order Placed
        OrderTrackerCard(
          title: "Order Recevied",
          isOrder: true,
          status: widget.status,
          controller: controller,
          activeColor: widget.activeColor,
          isCompleted: isFirst,
          itemTitleAndDateList: const ["Order has been received successfully"],
        ),
        // Add Cancelled status card if order has been cancelled
        widget.status == OrderStatus.cancelled
            ? OrderTrackerCard(
                title: "Cancelled",
                status: widget.status,
                activeColor: AppColor.golden,
                iconColor: AppColor.redColor,
                icon: CupertinoIcons.xmark.codePoint,
                isOrderDelivered: true,
                itemTitleAndDateList: const [
                  "Unfortunately, your order has been cancelled"
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Accepted
                  OrderTrackerCard(
                    title: "Order Accepted",
                    status: widget.status,
                    controller: controller2,
                    activeColor: widget.activeColor,
                    isCompleted: isSecond,
                    itemTitleAndDateList: const [
                      "Your order has been accepted and is being processed"
                    ],
                  ),
                  // Order Processing
                  OrderTrackerCard(
                    title: "Order Processing",
                    status: widget.status,
                    controller: controller3,
                    activeColor: widget.activeColor,
                    isCompleted: isThird,
                    itemTitleAndDateList: const [
                      "Your order is being processed"
                    ],
                  ),
                  // Ready for Pickup
                  OrderTrackerCard(
                    title: "Ready for Pickup",
                    status: widget.status,
                    controller: controller4,
                    activeColor: widget.activeColor,
                    isCompleted: isFourth,
                    itemTitleAndDateList: const [
                      "Your order is ready for pickup/delivery"
                    ],
                  ),
                  // Out for delivery
                  OrderTrackerCard(
                    title: "Delivery in Progress",
                    status: widget.status,
                    controller: controller5,
                    activeColor: widget.activeColor,
                    isCompleted: isFifth,
                    itemTitleAndDateList: const [
                      "Your order is out for delivery"
                    ],
                  ),
                  // Order is Delivered
                  OrderTrackerCard(
                    title: "Delivered",
                    status: widget.status,
                    activeColor: widget.activeColor,
                    itemTitleAndDateList: const [
                      "Congratulations your order has been Delivered"
                    ],
                    isOrderDelivered: true,
                  ),
                ],
              ),
      ],
    );
  }
}

class OrderTrackerCard extends StatefulWidget {
  final OrderStatus? status;
  final bool? isCompleted;
  final bool? isOrder;
  final String title;
  final List<String>? itemTitleAndDateList;
  final Color? activeColor;
  final AnimationController? controller;
  final bool? isOrderDelivered;
  final int? icon;
  final Color? iconColor;

  const OrderTrackerCard({
    super.key,
    this.itemTitleAndDateList,
    this.activeColor,
    this.controller,
    required this.title,
    this.isOrderDelivered,
    this.status,
    this.isCompleted,
    this.isOrder,
    this.icon,
    this.iconColor,
  });

  @override
  State<OrderTrackerCard> createState() => _OrderTrackerCardState();
}

class _OrderTrackerCardState extends State<OrderTrackerCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    Color getContainerColor() {
      Color? contianerColor = widget.isOrder ?? false
          ? widget.activeColor
          : (widget.status == OrderStatus.accepted ||
                      widget.status == OrderStatus.processing ||
                      widget.status == OrderStatus.readyForPickup ||
                      widget.status == OrderStatus.outForDelivery ||
                      widget.status == OrderStatus.delivered) &&
                  (widget.isCompleted == true ||
                      widget.status?.name == OrderStatus.delivered.name)
              ? widget.activeColor ?? Colors.green
              : Colors.grey[300];
      return contianerColor!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.027),
              decoration: BoxDecoration(
                color: getContainerColor(),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(
                      widget.icon ?? CupertinoIcons.check_mark.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: widget.iconColor ?? AppColor.white,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: CupertinoIcons.check_mark.fontFamily,
                    package: CupertinoIcons.check_mark.fontPackage,
                  ),
                ),
              ),
            ),
            SizedBox(width: width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextPoppines(
                  text: widget.title,
                  fontSize: width * 0.033,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  width: width * 0.65,
                  child: MyTextSansPro(
                    text: widget.itemTitleAndDateList?.first ?? "",
                    fontSize: width * 0.033,
                    maxLines: 1,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Progress line
        widget.isOrderDelivered ?? false
            ? const SizedBox()
            : Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.036),
                    child: SizedBox(
                      width: width * 0.005,
                      height: widget.itemTitleAndDateList != null &&
                              widget.itemTitleAndDateList!.isNotEmpty
                          ? widget.itemTitleAndDateList!.length * 35
                          : 60,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: LinearProgressIndicator(
                          value: widget.controller?.value ?? 0.0,
                          backgroundColor: AppColor.greyColor.withOpacity(0.8),
                          color: widget.activeColor ?? Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}

class TextDto {
  String? title;
  TextDto(this.title);
}


  // @override
  // void initState() {
  //   //* Order Recevide
  //   if (widget.status?.name == OrderStatus.received.name ||
  //       widget.status?.name == OrderStatus.cancelled.name) {
  //     ///initialize first controller
  //     controller = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller?.value != null && controller!.value > 0.99) {
  //           controller?.stop();
  //         }
  //         setState(() {});
  //       });
  //   } else if (widget.status?.name == OrderStatus.shipped.name) {
  //     ///initialize first controller
  //     controller = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller?.value != null && controller!.value > 0.99) {
  //           controller?.stop();
  //           controller2?.stop();
  //           isFirst = true;
  //           controller2?.forward(from: 0.0);
  //         }
  //         setState(() {});
  //       });

  //     //* initialize second controller
  //     controller2 = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller2?.value != null && controller2!.value > 0.99) {
  //           controller2?.stop();
  //           controller3?.stop();
  //           isSecond = true;
  //           controller3?.forward(from: 0.0);
  //         }
  //         setState(() {});
  //       });
  //   } else if (widget.status?.name == OrderStatus.outOfDelivery.name ||
  //       widget.status?.name == OrderStatus.delivered.name) {
  //     ///initialize first controller
  //     controller = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller?.value != null && controller!.value > 0.99) {
  //           controller?.stop();
  //           controller2?.stop();
  //           controller3?.stop();
  //           isFirst = true;
  //           controller2?.forward(from: 0.0);
  //         }
  //         setState(() {});
  //       });

  //     //* initialize second controller
  //     controller2 = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller2?.value != null && controller2!.value > 0.99) {
  //           controller2?.stop();
  //           controller3?.stop();
  //           isSecond = true;
  //           controller3?.forward(from: 0.0);
  //         }
  //         setState(() {});
  //       });

  //     //* initialize third controller
  //     controller3 = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 2),
  //     )..addListener(() {
  //         if (controller3?.value != null && controller3!.value > 0.99) {
  //           controller3?.stop();
  //           isThird = true;
  //         }
  //         setState(() {});
  //       });
  //   }

  //   controller?.repeat(reverse: false);
  //   controller2?.repeat(reverse: false);
  //   controller3?.repeat(reverse: false);
  //   super.initState();
  // }