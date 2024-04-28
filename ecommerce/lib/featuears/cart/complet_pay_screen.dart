import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/widgets/defult_button.dart';
import 'package:ecommerce/core/widgets/snakbar_widget.dart';
import 'package:ecommerce/featuears/Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import 'package:ecommerce/featuears/cart/manger/cubit/cubit.dart';
import 'package:ecommerce/featuears/cart/manger/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/custom_nav.dart';
import 'toggle_screen.dart';
import 'widget/cart_info_item.dart';

class CompletPayScreen extends StatelessWidget {
  const CompletPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          title: const Text('Complet Payment '),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is PaymentRequestTokenSuccessStates) {
              showsnakbarwidget(context, 'Success get final token', true);
              navigateTo(context, const ToggleScreen());
            }
            if (state is PaymentRequestTokenErrorStates) {
              showsnakbarwidget(context, '${state.error}', false);
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            var cuubit = BlocProvider.of<LayoutCubit>(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    Container(
                      height: 220.h,
                      child: SvgPicture.asset(AppAssets.imagecompletCart),
                    ),
                    // Expanded(child: SvgPicture.asset(AppAssets.imagecompletCart)),
                    SizedBox(
                      height: 25.h,
                    ),
                    // const OrderInfoItem(
                    //   title: 'name',
                    //   value: r'0$',
                    // ),
                    SizedBox(
                      height: 3.h,
                    ),

                    OrderInfoItem(
                      title: 'Price Order ',
                      value: '${cuubit.totalPrice} \$',
                      // r'42.97$',
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    const OrderInfoItem(
                      title: 'Discount',
                      value: r'0$',
                    ),
                    Divider(
                      thickness: 2,
                      height: 34.h,
                      color: const Color(0xffC7C7C7),
                    ),
                    OrderInfoItem(
                        title: 'Total Price', value: '${cuubit.totalPrice} \$'
                        // r'50.97 $',
                        ),
                    // const Text('Total' r'$50.97'),
                    SizedBox(
                      height: 16.h,
                    ),
                    DefaultButton(
                      text: 'Pay Now',
                      press: () {
                        cubit.getOrderRegistrationID(
                          price: '${cuubit.totalPrice} \$',
                        );
                        navigateTo(context, ToggleScreen());
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
