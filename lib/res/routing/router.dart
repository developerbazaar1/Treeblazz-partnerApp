import 'package:flutter/material.dart';
import 'package:tb_patner/features/auth/screen/signin_screen.dart';
import 'package:tb_patner/features/auth/screen/signup_screen.dart';
import 'package:tb_patner/features/edit%20profile/screen/edit_profile_screen.dart';
import 'package:tb_patner/features/faq/screens/faq_screen.dart';
import 'package:tb_patner/features/home/screens/home_screen.dart';
import 'package:tb_patner/features/notification/screen/notification_screen.dart';
import 'package:tb_patner/features/order/screen/cancelled_order_screen.dart';
import 'package:tb_patner/features/order/screen/delivered_order_screen.dart';
import 'package:tb_patner/features/order/screen/ready_for_pickup_order_screen.dart';
import 'package:tb_patner/features/orders%20detailes/screen/order_detaile_screen.dart';
import 'package:tb_patner/features/password/screen/change_password_screen.dart';
import 'package:tb_patner/features/privacy%20and%20policy/privacy_policy_screen.dart';
import 'package:tb_patner/features/onboarding/screen/on_boarding_screen.dart';
import 'package:tb_patner/features/support/screens/support_screen.dart';
import 'package:tb_patner/features/t&c/screens/terms_and_conditions_screen.dart';
import 'package:tb_patner/res/comman/app_buttomBar.dart';

import '../comman/my_text.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case AppBottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AppBottomBar(),
      );
    case OrderDetaileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrderDetaileScreen(),
      );
    case ReadyForPickupOrderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ReadyForPickupOrderScreen(),
      );
    case DeliveredOrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DeliveredOrdersScreen(),
      );
    case CancelledOrderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CancelledOrderScreen(),
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationScreen(),
      );
    // case MyAddressScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const MyAddressScreen(),
    //   );
    // case AddAddressScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddAddressScreen(),
    //   );
    // case AddNewAddresScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddNewAddresScreen(),
    //   );
    case EditProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EditProfileScreen(),
      );
    case ChangePasswordScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ChangePasswordScreen(),
      );

    case TermsAndConditionsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TermsAndConditionsScreen(),
      );

    case PrivacyAndPolicyScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PrivacyAndPolicyScreen(),
      );
    case SupportScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SupportScreen(),
      );
    case FAQScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FAQScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: MyTextPoppines(text: "No routes defined"),
          ),
        ),
      );
  }
}
