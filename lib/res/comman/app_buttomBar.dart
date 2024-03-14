import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tb_patner/features/home/screens/home_screen.dart';
import 'package:tb_patner/features/my%20finance/screens/my_finance_screen.dart';
import 'package:tb_patner/features/products/screens/all_product_screen.dart';
import 'package:tb_patner/features/order/screen/order_screen.dart';
import 'package:tb_patner/features/user%20profile/screens/profile_screen.dart';
import 'package:tb_patner/res/comman/app_colors.dart';
import 'package:tb_patner/utils/utils.dart';

class AppBottomBar extends StatefulWidget {
  final int? selectedIndex;
  static const String routeName = '/bottomBar';
  const AppBottomBar({super.key, this.selectedIndex});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.selectedIndex ?? 0;
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  PageController _pageController = PageController();

  List<Widget> pages = [
    const HomeScreen(),
    const ProductScreen(),
    const OrderScreen(),
    const MyFinanceScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.008,
          horizontal: width * 0.01,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.greyColor.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          color: AppColor.white,
        ),
        child: Theme(
          data: Utils.noSplashEffect(context),
          child: BottomNavigationBar(
            elevation: 0.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: AppColor.white,
                icon: Icon(
                  Iconsax.home_copy,
                  color: _getColor(0),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.white,
                icon: Icon(
                  Iconsax.box_copy,
                  color: _getColor(1),
                ),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.white,
                icon: Icon(
                  Iconsax.receipt_1_copy,
                  color: _getColor(2),
                ),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.white,
                icon: Icon(
                  Iconsax.money_2_copy,
                  color: _getColor(3),
                ),
                label: 'Finance',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColor.white,
                icon: Icon(
                  Iconsax.user_copy,
                  color: _getColor(4),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            // Ensure labels are always displayed
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            selectedItemColor: Colors.black,
            selectedFontSize: width * 0.035,
            selectedIconTheme: IconThemeData(size: width * 0.06),
            unselectedItemColor: AppColor.greyColor,
            unselectedFontSize: width * 0.035,
            unselectedIconTheme: IconThemeData(size: width * 0.065),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    return _selectedIndex == index ? AppColor.redColor : AppColor.greyColor;
  }
}
