import 'package:tb_patner/data/models/dashboard_order.dart';
import 'package:tb_patner/data/models/menu_categories.dart';
import 'package:tb_patner/data/models/order.dart';
import 'package:tb_patner/res/comman/app_colors.dart';

import '../../data/models/products.dart';
import '../../utils/enum.dart';
import 'app_images.dart';

class AppList {
  // Product Img
  static List productsImg = [
    AppImages.organicCBDFlower,
    AppImages.preRolls,
    AppImages.edibles,
    AppImages.cartridges,
    AppImages.bong,
    AppImages.vap,
    AppImages.hempCBD,
    AppImages.preRolls,
  ];

  // List of Products
  static List<Products> products = [
    Products(
      "Organic CBD Flower Cured With Terpenes",
      250,
      "Organic CBD Flower Cured With Terpenes in the aromatic delight of our premium cannabis flower, meticulously cultivated and expertly harvested to deliver unparalleled quality and potency. Available in a variety of strains to suit your mood and preferences, GreenGrove Herbal Bliss invites you to elevate your senses and embark on a journey of blissful relaxation and euphoria.",
      5.0,
      [
        AppImages.organicCBDFlower,
        AppImages.organicCBDFlower,
        AppImages.organicCBDFlower,
        AppImages.organicCBDFlower,
      ],
      ProductCategory.flower,
    ),
    Products(
      "GreenGrove Concentrates - Pure Extracts",
      59,
      "Experience the pinnacle of potency with our premium cannabis concentrates. Carefully crafted using state-of-the-art extraction methods, GreenGrove Concentrates offer a potent and pure experience that is second to none. Whether you prefer wax, shatter, or live resin, our concentrates deliver exceptional flavor and effects for a truly elevated experience.",
      4.9,
      [
        AppImages.conical,
        AppImages.conical,
        AppImages.conical,
        AppImages.conical
      ],
      ProductCategory.smoking,
    ),
    Products(
      "GreenGrove Edibles - Delectable Treats",
      29,
      "Satisfy your cravings with our delicious selection of cannabis-infused edibles. From gourmet chocolates to tantalizing gummies, GreenGrove Edibles offer a mouthwatering array of treats to indulge your senses. Made with premium ingredients and precisely dosed for consistency, our edibles provide a delightful experience that's perfect for any occasion.",
      4.7,
      [
        AppImages.edibles,
        AppImages.edibles,
        AppImages.edibles,
        AppImages.edibles,
      ],
      ProductCategory.edibles,
    ),
    Products(
      "Organic CBD Flower Cured With Terpenes",
      240,
      "Discover the therapeutic benefits of organic CBD flower infused with aromatic terpenes. Grown with care and cured to perfection, our CBD flower offers a natural and holistic solution for relaxation, pain relief, and stress reduction. Experience the soothing effects of CBD combined with the aromatic nuances of terpenes for a truly blissful experience.",
      4.6,
      productsImg,
      ProductCategory.flower,
    ),
  ];

// List of Dashboard order
  static List<DashboardOrder> dashboardOrder = [
    DashboardOrder(
      quantity: 5,
      title: "New Order Request",
      boxColor: AppColor.lightPink,
    ),
    // DashboardOrder(
    //   quantity: 0,
    //   title: "Upcoming Request",
    //   boxColor: AppColor.hd_lightBlue,P
    // ),
    DashboardOrder(
      quantity: 10,
      title: "Orders Processing",
      boxColor: AppColor.hd_lightPurple,
    ),
    DashboardOrder(
      quantity: 2,
      title: "Ready For Delivery/Pickup",
      boxColor: AppColor.hd_lightGreen,
    ),
    DashboardOrder(
      quantity: 0,
      title: "On The Way",
      boxColor: AppColor.hd_lightGreen,
    ),
    DashboardOrder(
      quantity: 235,
      title: "Delivered Orders",
      boxColor: AppColor.hd_cream,
    ),
    DashboardOrder(
      quantity: 50,
      title: "Cancelled Orders",
      boxColor: AppColor.lightPink,
    ),
  ];

// Orders list
  static List<Order> dummyOrders = [
    Order(
      id: "53452",
      price: '\$25.99',
      date: '2024-03-10',
      time: '10:30 AM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "78623",
      price: '\$32.50',
      date: '2024-03-11',
      time: '11:45 AM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "98765",
      price: '\$18.75',
      date: '2024-03-12',
      time: '09:15 AM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "12345",
      price: '\$29.99',
      date: '2024-03-13',
      time: '01:00 PM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "23456",
      price: '\$42.95',
      date: '2024-03-14',
      time: '03:30 PM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "34567",
      price: '\$17.50',
      date: '2024-03-15',
      time: '12:15 PM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "45678",
      price: '\$38.20',
      date: '2024-03-16',
      time: '09:45 AM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "56789",
      price: '\$22.75',
      date: '2024-03-17',
      time: '11:00 AM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "67890",
      price: '\$35.45',
      date: '2024-03-18',
      time: '02:20 PM',
      img: AppImages.organicCBDFlower,
    ),
    Order(
      id: "78901",
      price: '\$19.99',
      date: '2024-03-19',
      time: '10:00 AM',
      img: AppImages.organicCBDFlower,
    ),
  ];

  // Menu Categories
  static List<MenuCategories> menuCategories = [
    MenuCategories(
      title: "Cannabis",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_lightPink,
    ),
    MenuCategories(
      title: "Vegitable and Fruits",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_lightGreen,
    ),
    MenuCategories(
      title: "Personal Care",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_cream,
    ),
    MenuCategories(
      title: "Home Care",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_lightBlue,
    ),
    MenuCategories(
      title: "Drinks",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_lightPink,
    ),
    MenuCategories(
      title: "Cannabis",
      img: AppImages.organicCBDFlower,
      color: AppColor.hd_cream,
    ),
  ];

  //
  static List<Finance> financeList = [
    Finance(title: "Today Earning", earning: "100"),
    Finance(title: "Weekly Earning", earning: "400"),
    Finance(title: "Febarury 2024", earning: "1420"),
    Finance(title: "January 2024", earning: "1320"),
    Finance(title: "December 2023", earning: "1100"),
    Finance(title: "November 2023", earning: "1500"),
  ];

  // Dropdown product quantity
  static List<String> quantity = [
    '1 kg',
    '2 kg',
    '5 kg',
    '10 kg',
    '15 kg',
  ];

  // Dropdown product categories
  static List<String> categories = [
    'Cannabis',
    "Vegitable and Fruits",
    "Personal Care",
    "Home Care",
    "Drinks",
  ];

  // Product Names according to Categories
  static Map<ProductCategories, List<String>> categoryWords = {
    ProductCategories.cannabis: [
      'Indica',
      'Sativa',
      'Hybrid',
      'Edibles',
      'Concentrates'
    ],
    ProductCategories.vegitable: [
      'Organic',
      'Fresh',
      'Local',
      'Exotic',
      'Seasonal'
    ],
    ProductCategories.personalCare: [
      'Organic',
      'Natural',
      'Vegan',
      'Luxury',
      'Gentle'
    ],
    ProductCategories.homeCare: [
      'Eco-Friendly',
      'Non-Toxic',
      'Fragrance-Free',
      'Pet-Safe'
    ],
    ProductCategories.drinks: [
      'Organic',
      'Artisanal',
      'Craft',
      'Premium',
      'Sparkling'
    ],
  };
}

class Finance {
  final String title;
  final String earning;

  Finance({required this.title, required this.earning});
}
