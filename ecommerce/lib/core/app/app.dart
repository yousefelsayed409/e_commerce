import 'package:ecommerce/featuears/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../../featuears/auth/signIn/manger/cubit/auth_login_cubit.dart';
import '../../featuears/auth/signIn/sign_in_screen.dart';
import '../../featuears/auth/signUp/manger/manger/auth_cubit.dart';
import '../../featuears/auth/signUp/sign_up_screen.dart';
import '../utils/constants.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

        ///todo___________ provider problem here___________
        providers: [
          BlocProvider(create: (context) => AuthSignInCubit()),
          BlocProvider(create: (context) => AuthSignUpCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              // home: Splashscreen(),
              debugShowCheckedModeBanner: false,
              initialRoute:
                  Token != null ? AppRoute.layoutScreen : AppRoute.splashScreen,
              onGenerateRoute: AppRoute.generateRoute,
            );
          },
        ));
  }
}
