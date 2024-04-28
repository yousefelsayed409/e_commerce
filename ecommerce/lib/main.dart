import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/widgets/api_constants.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/helper/Shared/Local_NetWork.dart';
import 'core/helper/Shared/blocobserver.dart';
import 'core/utils/constants.dart';

//  Goyousef2019@gmail.com
//  0123456789
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CashNetwork.CashInitialization();
  Token = await CashNetwork.getCashData(key: 'token');
  currenpassword = await CashNetwork.getCashData(key: 'password');
  debugPrint("User token is : $Token");
  debugPrint("User password is : $currenpassword");
  // debugPrint("authtoken is : ${ApiContest.paymentFirstToken}");
  // debugPrint("authtoken is : ${ApiContest.finalToken}");

  runApp(const App());
}



















 // routes: {
        //   // AppRoute.loginView: (context) => LoginView(),
        //   AppRoute.signInScreen: (context) => const SignInScreen(),
        //   AppRoute.homescreen: (context) => const HomeScreen(),
        //   AppRoute.forgetPassWord: (context) => const ForgotPasswordScreen(),
        //   AppRoute.loginSuccess: (context) => const LoginSuccessScreen(),
        //   AppRoute.signUpScreen: (context) => const SignUpScreen(),
        //   AppRoute.layoutScreen: (context) => const HomeNavBarWidget(),
        //   AppRoute.profile: (context) => const ProfileScreenT(),
        // },
        // home: Token == null ? const SplashScreen() : const HomeNavBarWidget()
        // home: SignInScreen(),