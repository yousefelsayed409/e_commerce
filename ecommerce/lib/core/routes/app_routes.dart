import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../featuears/Details/Detail_screen.dart';
import '../../featuears/Favorite/favorite_screen.dart';
import '../../featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../../featuears/Layout/Layout_screen.dart';
import '../../featuears/auth/otp/otp_screen.dart';
import '../../featuears/cart/Cart_screen.dart';
import '../../featuears/home/screen/Home_screen.dart';
import '../../featuears/profile/profile_screen.dart';
import '../../featuears/auth/forgot_password/forgot_password_screen.dart';
import '../../featuears/auth/login_success/login_success_screen.dart';
import '../../featuears/auth/signIn/sign_in_screen.dart';
import '../../featuears/auth/signUp/sign_up_screen.dart';
import '../../featuears/on_boarding/onboarding_screen.dart';
import '../../featuears/splash/splash_screen.dart';
import '../models/product_model.dart';

class AppRoute {
  static const signInScreen = 'SignInScreen';
  static const profileScreen = 'ProfileScreen';
  static const splashScreen = 'SplashScreen';
  static const signUpScreen = 'SignUpScreen';
  static const homescreen = 'HomeScreen';
  static const onBoardingScreen = 'OnBoardingScreen';
  static const favoriteScreen = 'FavoriteScreen';
  static const categoryScreen = 'CategoryScreen';
  static const cartScreen = 'CartScreen';
  static const forgetPassWordScreen = 'ForgotPasswordScreen';
  static const layoutScreen = 'LayoutScreen';
  static const otpScreen = 'OtpScreen';
  // static const profile = 'ProfileScreen';
  static const loginSuccess = 'LoginSuccessScreen';
  static const detailsScreen = 'DetailsScreen';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case forgetPassWordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case loginSuccess:
        return MaterialPageRoute(builder: (_) => const LoginSuccessScreen());
      case homescreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen());

      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case favoriteScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      //todo__________
      case layoutScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LayoutCubit()
                    ..getCarts()
                    ..getfavorite()
                    ..getBannersData()
                    ..getCategoriesData()
                    ..getProducts(),
                  child: const HomeNavBarWidget(),
                ));

      case detailsScreen:
        final ppprouduct = settings.arguments as ProductModel;

        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  ppprouduct: ppprouduct,
                ));
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('noRouteFound'),
            ),
          )),
    );
  }
}

