import 'package:get/get.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/pages/all_product/all_product_page.dart';
import 'package:yanapay/src/pages/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:yanapay/src/pages/category/category_page.dart';
import 'package:yanapay/src/pages/checkout/checkout_page.dart';
import 'package:yanapay/src/pages/on_boarding/on_boarding_page.dart';
import 'package:yanapay/src/pages/order/order_page.dart';
import 'package:yanapay/src/pages/order_detail/order_detail_page.dart';
import 'package:yanapay/src/pages/product/product_page.dart';
import 'package:yanapay/src/pages/profile_detail/profile_detail_page.dart';
import 'package:yanapay/src/pages/search/search_page.dart';
import 'package:yanapay/src/pages/sign_in/sign_in_page.dart';
import 'package:yanapay/src/pages/sign_up/sign_up_page.dart';
import 'package:yanapay/src/pages/splash/splash_page.dart';
import 'package:yanapay/src/pages/wallet/wallet_page.dart';

List<GetPage<dynamic>>? allRoutes = [
  GetPage<dynamic>(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.home,
    page: () => const BottomNavigationBarScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.search,
    page: () => const SearchScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.allProduct,
    page: () => const AllProductScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.product,
    page: () => const ProductScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.cart,
    page: () => const BottomNavigationBarScreen(initialIndex: 1),
  ),
  GetPage<dynamic>(
    name: Routes.checkoutSuccess,
    page: () => const CheckoutSuccessScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.profile,
    page: () => const BottomNavigationBarScreen(initialIndex: 3),
  ),
  GetPage<dynamic>(
    name: Routes.order,
    page: () => const OrderScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.orderDetail,
    page: () => const OrderDetailScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.wallet,
    page: () => const WalletScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.category,
    page: () => const CategoryScreen(),
  ),
  GetPage<dynamic>(
    name: Routes.profileDetail,
    page: () => const ProfileDetailScreen(),
  ),
];
