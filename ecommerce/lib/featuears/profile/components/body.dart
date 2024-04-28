import 'package:ecommerce/featuears/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';


import '../../../core/routes/app_routes.dart';
import '../my_account_screen.dart';
import 'profile_menu.dart';

class Bodyprofile extends StatelessWidget {
  const Bodyprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          // SwitchListTile(
          //   title: Text(themprovider.getIsdarkThem ? 'DarkMode' : 'LightMode'),
          //   value: themprovider.getIsdarkThem,
          //   onChanged: (value) {
          //     themprovider.setdartThem(value);
          //   },
          // ),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            asetsimage: Icons.account_circle,
            press: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MyAcountScreen();
              }))
            },
          ),
          ProfileMenu(
            text: "Notifications",
            asetsimage: Icons.notifications,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            asetsimage: Icons.settings,
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            asetsimage: Icons.help,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            asetsimage: Icons.exit_to_app,
            press: () {
              // Navigator.pushReplacementNamed(context, AppRoute.signInScreen);
            },
          ),
        ],
      ),
    );
  }
}
