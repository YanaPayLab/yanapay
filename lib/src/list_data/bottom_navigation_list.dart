import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:yanapay/src/pages/cart/cart_page.dart';
import 'package:yanapay/src/pages/home/home_page.dart';
import 'package:yanapay/src/pages/profile/profile_page.dart';
import 'package:yanapay/src/pages/wallet/wallet_page.dart';
 

class BottomNavigationList {
  static List<Widget> pageList(BuildContext context) => [
        const HomeScreen(),
        const CartScreen(),
        const WalletScreen(),
        const ProfileScreen(),
      ];
  static List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.shoppingBag),
          label: 'Marketplace',
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.shoppingCart),
          label: 'Carrito',
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.creditCard),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.user),
          label: 'Perfil',
        ),
      ];
}
