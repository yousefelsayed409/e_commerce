import 'package:ecommerce/featuears/home/screen/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


import '../../core/utils/app_color.dart';
import '../Favorite/favorite_screen.dart';
import '../cart/Cart_screen.dart';
import '../profile/my_account_screen.dart';
import '../profile/profile_screen.dart';

PersistentTabController? controllerr;

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarStyle: NavBarStyle.style1,
      context,
      items: _navBarsItems(),
      controller: controllerr,
      backgroundColor: Colors.white,
      screens: _buildScreens(),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.h), topRight: Radius.circular(10.h)),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
        color: AppColors.Teal,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.favorite,
        color: AppColors.Teal,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.shopping_cart,
        color: AppColors.Teal,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.person,
        color: AppColors.Teal,
      ),
    ),
  ];
}
