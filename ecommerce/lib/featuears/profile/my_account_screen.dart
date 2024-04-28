import 'package:ecommerce/featuears/profile/update_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/utils/app_styles.dart';
import '../../core/widgets/defult_button.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'change_password_screen.dart';

class MyAcountScreen extends StatelessWidget {
  const MyAcountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        if (cubit.userModel == null) cubit.getUserData();
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.teal,
              title: const Text("My Account"),
            ),
            body: cubit.userModel != null
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(cubit.userModel!.image!),
                            radius: 45,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            cubit.userModel!.name!,
                            style: AppStyles.textStyle20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.userModel!.email!,
                            style: AppStyles.textStyle20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultButton(
                            text: "Change Password",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordScreen()));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultButton(
                            text: "Update Data",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateDataScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ));
      },
    );
  }
}

// const Bodyprof()